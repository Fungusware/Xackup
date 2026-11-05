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
