# Xackup - Backup for XenServer/XCP-ng

A place for Xackup users to gather and find useful resources.

# About

We didn’t want to pay 1000’s to backup our XenServer and XCP-ng VMs and now you don’t have to either. You can thank us later 🙂

Xackup is designed to be an easy to use light weight solution to back-up your XenServer or XCP-ng virtual machines.

Xackup is a commercial product that can be found here : https://www.xenserver-backup.com/ . This repository serves to manage Downloads, Releases and Release Notes



# Install

Xackup 2.12 is the stable release. There is one release channel. Install with the Windows Installer or with PowerShell; both are supported and give the same result.

## Windows Installer

1. Download `Install_Xackup_<version>.zip` from the [Releases](https://github.com/Fungusware/Xackup/releases) page and unzip it.
2. Run `Install_Xackup_<version>.exe`.

To upgrade, run the newer Windows Installer. To remove, uninstall **Xackup v2** in Apps & features.

## PowerShell

Open PowerShell as Administrator and run:

```powershell
irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
```

It downloads the newest release and runs its installer, which asks a few questions. Run the same command again to upgrade. It works whatever the script execution policy is (the installer runs with it bypassed for this one run).

**One particular version** (to go back to an earlier release):

```powershell
$env:XACKUP_DESKTOP_VERSION = '2.12.15.0'; irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
```

**Without internet access to GitHub raw:** download `Xackup-Desktop-win-x86.zip` from the Releases page, unzip it, open PowerShell as Administrator in the folder and run:

```
.\Install-XackupDesktop.ps1
```

If PowerShell says running scripts is disabled, run this instead (this one run only):

```
powershell -ExecutionPolicy Bypass -File .\Install-XackupDesktop.ps1
```

The installer adds the .NET runtimes Xackup needs if they are missing (internet access is needed for that), installs the Xackup service and the desktop app, and asks whether other computers may connect to this Xackup service (if so, it opens the port in the Windows firewall). A Windows Installer install is removed first; your jobs and settings are kept.

### Upgrade backup

When it finds existing data, the installer asks whether to back it up first (the default is yes). If you say yes, it zips your data folder (`C:\ProgramData\Fungusware\Xackup`) to `C:\ProgramData\Fungusware\Xackup-backups` before it replaces the program files. The newest five backups are kept. Add `-NoBackup` to skip the question and the backup; with `-Unattended` the backup is made without asking. To go back to an earlier version, install it with the one-particular-version command above, then unzip the backup over the data folder.

### Remove

Run `.\Uninstall-XackupDesktop.ps1` (add `-Purge` to delete your data too), or remove **Xackup v2** in Apps & features.


# Xackup Server (preview)

Xackup Server runs Xackup as a service on Windows or Linux and gives you the whole of Xackup in a browser. Scheduled jobs run on the server, so nobody has to be signed in. It is the 3.x preview and is released next to Xackup 2.12: Xackup 2.12 and the desktop installers above are unchanged.

Requirements: Windows 10 (1607) or Windows Server 2016 and newer, 64-bit; or Linux x64 or ARM64 with systemd. Tested on Synology DSM 7 (also as a package, see below). Xackup Server brings its own .NET runtime.

## Windows

Open PowerShell as Administrator and run:

```powershell
irm https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.ps1 | iex
```

It downloads the newest Xackup Server release and runs its installer, which asks a few questions: the port (default 19177), whether other computers may connect, and whether to install the desktop app. Run the same command again to upgrade.

**One particular version:**

```powershell
$env:XACKUP_SERVER_VERSION = '3.26.1109.1129'; irm https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.ps1 | iex
```

**Without internet access to GitHub raw:** download `Xackup-Server-win-x64.zip` from the Releases page, unzip it, open PowerShell as Administrator in the folder and run `.\Install-XackupServer.ps1` (or `powershell -ExecutionPolicy Bypass -File .\Install-XackupServer.ps1`). Options such as `-Port`, `-LocalOnly`, `-Desktop` and `-Unattended` are listed in `README.txt` in the package.

**Remove:** `.\Uninstall-XackupServer.ps1` (add `-Purge` to delete your data too).

## Linux

```sh
curl -fsSL https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.sh | sudo bash
```

Options go after `--`, for example `... | sudo bash -s -- --port 8080 --local-only`. To install one particular version: `sudo XACKUP_SERVER_VERSION=3.26.1109.1129 bash install.sh`.

If `curl` fails with `no common encryption algorithm` (an old curl on some NAS), use wget for the first step instead: `wget -qO- https://raw.githubusercontent.com/Fungusware/Xackup/main/server/install.sh | sudo bash`. If neither can reach GitHub, download the package on another computer (see below), copy it to the machine, and run `tar -xzf Xackup-Server-linux-x64.tar.gz && sudo ./install-xackup-server.sh`. Or download `Xackup-Server-linux-x64.tar.gz` (or `-linux-arm64`) from the Releases page, unpack it and run `sudo ./install-xackup-server.sh`.

The service is `xackup-server`. Data is in `/var/lib/xackup-server`, saved servers and locations in `/usr/share/Fungusware/Xackup`, settings in `/etc/xackup-server/server.env`. Remove with `sudo ./uninstall-xackup-server.sh` (add `--purge` to delete the data). On Synology DSM 7, run the installer over SSH as an administrator with `sudo`, or use the Synology package below.

## Synology DSM 7 package (.spk)

On a Synology NAS you can install Xackup Server as a package instead of with the script. Run it on the NAS that stores your backups and the backup traffic no longer crosses the network twice. Not supported: DSM 6 and 32-bit ARM models.

**Recommended: add the Fungusware package source.** Package Center then installs Xackup Server for you, picks the right build for your NAS and shows an **Update** button when a new version is out.

1. In **Package Center > Settings > General**, set **Trust Level** to **Any publisher**. The packages are not signed.
2. In **Package Center > Settings > Package Sources**, choose **Add** and enter any name (for example `Fungusware`) and the location `https://www.fungusware.com/synology`.
3. Open **Package Center > Community**, find **Xackup Server** and choose **Install**. The same source also lists **Metis Dashboard**.
4. Give the package's user access to the folder that holds your backups: **Control Panel > Shared Folder**, select the share, **Edit > Permissions**, set **System internal user** to show `sc-XackupServer` and give it **Read/Write**.
5. Open `http://<nas>:19177` (the **Open** button in Package Center) and sign in as described below.

**Without the package source:** download `XackupServer-x64-<version>.spk` (Intel and AMD models) or `XackupServer-arm64-<version>.spk` (ARM64 models) from the [Releases](https://github.com/Fungusware/Xackup/releases) page, choose **Manual Install** in Package Center and select the file. Then continue with step 4 above. Install a newer `.spk` over the old one to upgrade.

The package runs as its own limited user, because DSM 7 does not let third-party packages run as root. Its data is in `/var/packages/XackupServer/var`. Optional settings go in `/var/packages/XackupServer/var/server.env`, one `NAME=value` per line, for example `XackupAPIUrl=http://0.0.0.0:8080`; restart the package afterwards.

Your data is kept when you upgrade. To remove the package, uninstall it in Package Center.

## First sign-in and updates

Open `http://<server>:19177`. A new install has one account, `xackup` with the password `xackup`, and asks you to choose a new password. Users are Viewers (look only) or Operators.

The web page shows an **Update available** button, with the command to run, when a newer Xackup Server release is out. Xackup Server releases are the ones tagged `3.*`; they are marked as pre-releases and never replace Xackup 2.12 as the latest release.

## Extracting files from a backup

Choose **Utilities > Extract files**, pick a backup and open it. The disks, volumes and folders inside are shown as a tree. Tick files, folders or whole disks, then **Download** (a single file as it is, anything else as a zip) or **Save to a folder** on the server (a disk is saved as a VHD, and nothing already in the folder is overwritten).

It opens .xva, .xackup, .x2m and .xva.gz backups, including password protected ones. A compressed or zipped backup is unpacked into the work folder first (**Configuration > Advanced**), so that folder needs as much free space as the backup holds. Differential (.xdiff) backups cannot be opened. Extract needs the Elite or Xackup Server license and an Operator account.

## License

Only a Xackup Server license lets the web page change jobs, schedules and settings. With any other license, or none, the web page is read only: running jobs, existing schedules, start and stop, and restores still work. A Xackup Server license also unlocks the desktop app. Enter it on the License page.
