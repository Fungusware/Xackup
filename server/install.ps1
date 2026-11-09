# Installs or upgrades Xackup Server: downloads the newest Xackup Server release from GitHub and runs its installer.
#
#   irm https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.ps1 | iex
#
# Run it in PowerShell as Administrator. It works whatever the script execution policy is, because the installer is run with
# -ExecutionPolicy Bypass (for this run only). The installer asks you about the settings; to give them as options instead, download the zip
# from the Xackup releases page and run Install-XackupServer.ps1 yourself (add -Unattended to ask nothing).
# To install one particular version, set $env:XACKUP_SERVER_VERSION first, for example '3.26.1031.0750'.

& {
    $ErrorActionPreference = 'Stop'
    $ProgressPreference = 'SilentlyContinue'      # the progress bar makes downloads very slow in Windows PowerShell 5.1
    $repo = 'Fungusware/Xackup'
    $asset = 'Xackup-Server-win-x64.zip'

    $principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        throw 'Open PowerShell as Administrator (right-click it, Run as administrator) and run this again.'
    }

    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    if ($env:XACKUP_SERVER_VERSION) {
        $url = "https://github.com/$repo/releases/download/$($env:XACKUP_SERVER_VERSION)/$asset"
    }
    else {
        # Xackup Server releases are the ones tagged 3.* that carry the package; take the highest version
        $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=30" -Headers @{ 'User-Agent' = 'Xackup-Server-Install' }
        $newest = $releases | Where-Object { -not $_.draft -and $_.tag_name -like '3.*' -and ($_.assets | Where-Object { $_.name -eq $asset }) } |
            Sort-Object { [version]($_.tag_name.TrimStart('v')) } -Descending | Select-Object -First 1
        if (-not $newest) { throw "No Xackup Server release with $asset was found at https://github.com/$repo/releases" }
        $url = ($newest.assets | Where-Object { $_.name -eq $asset }).browser_download_url
    }

    $dir = Join-Path $env:TEMP ("Xackup-Server-" + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $dir | Out-Null

    try {
        Write-Host "Downloading $url"
        Invoke-WebRequest $url -OutFile (Join-Path $dir 'package.zip') -UseBasicParsing
        Expand-Archive (Join-Path $dir 'package.zip') -DestinationPath $dir
        powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $dir 'Install-XackupServer.ps1')
    }
    finally {
        Remove-Item -Recurse -Force $dir -ErrorAction SilentlyContinue
    }
}
