# Xackup - Backup for XenServer/XCP-ng

A place for Xackup users to gather and find useful resources.

# About

We didn’t want to pay 1000’s to backup our XenServer and XCP-ng VMs and now you don’t have to either. You can thank us later 🙂

Xackup is designed to be an easy to use light weight solution to back-up your XenServer or XCP-ng virtual machines.

Xackup is a commercial product that can be found here : https://www.xenserver-backup.com/ . This repository serves to manage Downloads, Releases and Release Notes



# Install

## One command

Open PowerShell as Administrator and run:

```powershell
irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
```

It downloads the newest **Stable** release and runs its installer, which asks a few questions. Run the same command again to upgrade. It works whatever the script execution policy is (the installer runs with it bypassed for this one run).

**Early Access:** for the newest Early Access release instead, run:

```powershell
$env:XACKUP_CHANNEL = 'early'; irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
```

(Until a Stable release includes the PowerShell installer, use the Early Access command.)

**One particular version:**

```powershell
$env:XACKUP_DESKTOP_VERSION = '2.12.15.0'; irm https://raw.githubusercontent.com/Fungusware/Xackup/main/desktop/install.ps1 | iex
```

## Download

Download the newest release from the [Releases](https://github.com/Fungusware/Xackup/releases) page. Two packages are attached to each release; use either one.

**Setup program** - `Install_Xackup_<version>.zip`

Unzip it and run the installer.

**PowerShell** - `Xackup-Desktop-win-x86.zip`

1. Unzip it.
2. Open PowerShell as Administrator in the folder.
3. Run:

   ```
   .\Install-XackupDesktop.ps1
   ```

   If PowerShell says running scripts is disabled, run this instead (this one run only):

   ```
   powershell -ExecutionPolicy Bypass -File .\Install-XackupDesktop.ps1
   ```

It installs the .NET runtimes Xackup needs if they are missing (internet access is needed for that), installs the Xackup service and the desktop app, and asks whether other computers may connect to this Xackup service (if so, it opens the port in the Windows firewall). An earlier setup-program install is removed first; your jobs and settings are kept.

## Upgrade

Run the one command again, or run the installer from the newer release. Your jobs, saved servers and licence are kept.

## Remove

Run `.\Uninstall-XackupDesktop.ps1` (add `-Purge` to delete your data too), or remove **Xackup v2** in Apps & features.
