# Installs or upgrades the Xackup desktop app and its service: downloads the newest desktop release from GitHub and runs its installer.
#
#   irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
#
# Run it in PowerShell as Administrator. It works whatever the script execution policy is, because the installer is run with
# -ExecutionPolicy Bypass (for this run only). The installer asks you about the settings; to give them as options instead, download the zip
# from the Xackup releases page and run Install-XackupDesktop.ps1 yourself (add -Unattended to ask nothing).
# To install one particular version, set $env:XACKUP_DESKTOP_VERSION first, for example '2.12.15.0'.

& {
    $ErrorActionPreference = 'Stop'
    $ProgressPreference = 'SilentlyContinue'      # the progress bar makes downloads very slow in Windows PowerShell 5.1
    $repo = 'Fungusware/Xackup'
    $asset = 'Xackup-Desktop-win-x86.zip'

    $principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        throw 'Open PowerShell as Administrator (right-click it, Run as administrator) and run this again.'
    }

    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

    if ($env:XACKUP_DESKTOP_VERSION) {
        $url = "https://github.com/$repo/releases/download/$($env:XACKUP_DESKTOP_VERSION)/$asset"
    }
    else {
        # Desktop releases are the ones tagged 2.* that carry the package (the web UI's are tagged 3.*); take the highest version
        $releases = Invoke-RestMethod "https://api.github.com/repos/$repo/releases?per_page=30" -Headers @{ 'User-Agent' = 'Xackup-Desktop-Install' }
        $newest = $releases | Where-Object { -not $_.draft -and $_.tag_name -like '2.*' -and ($_.assets | Where-Object { $_.name -eq $asset }) } |
            Sort-Object { [version]($_.tag_name.TrimStart('v')) } -Descending | Select-Object -First 1
        if (-not $newest) { throw "No Xackup desktop release with $asset was found at https://github.com/$repo/releases" }
        $url = ($newest.assets | Where-Object { $_.name -eq $asset }).browser_download_url
    }

    $dir = Join-Path $env:TEMP ("Xackup-Desktop-" + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $dir | Out-Null

    try {
        Write-Host "Downloading $url"
        Invoke-WebRequest $url -OutFile (Join-Path $dir 'package.zip') -UseBasicParsing
        Expand-Archive (Join-Path $dir 'package.zip') -DestinationPath $dir
        powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $dir 'Install-XackupDesktop.ps1')
    }
    finally {
        Remove-Item -Recurse -Force $dir -ErrorAction SilentlyContinue
    }
}
