Release Notes
=============

Find out what has changed in the Stable and Early Access versions.

###### Version 2.5.23.0 (Early Access)

* Added custom mount commands per Saved Location for Backup and Restore.
* Fixed UI feedback and progress reporting during Restore operations.
* Fixes for browsing and testing CIFS/NFS and other Linux Mounts
* Remote support Updates.
* Fixes for access to Scheduling.
* UI fixes for Server details showing VERY large image.
* Revised Details Veiwer.
* UI Clean Ups.
* Fixed deleting Jobs causing error.
* Changed default Location when adding Saved Locations or Browsing for destinations.
* Detect and Log when a Job fails to load correctly.
* Modified the way Pre and Post Tasks are launched. Console windows should now be visible again.
* Brand new Scheduling system. Moves away from Windows Task Scheduler.
* Backend improvements to Xackup Server and API

###### Version 2.4.27.0 (Stable Release)

* Remote support Updates.
* Changed default Location when adding Saved Locations or Browsing for destinations.
* Detect and Log when a Job fails to load correctly.
* Modified the way Pre and Post Tasks are launched. Console windows should now be visible again.
* Fixed: Messed up Location Browsing and Saved Location screens.
* Fixed: Chained Jobs settings error.
* Added initial support for RustDesk remote help.
* Fixed: Missing dependencies causing start up to fail.
* Fixed: UI Layout bugs
* Fixed: Backup error claiming the API was not running.
* **Added ability to backup Snapshots.**
* Fixed: Snapshot only Backups no longer require a saved Location.
* Fixed: Restore logic to simplify configuration.
* GUI refactor for Saved Locations and Restoration.
* GUI actually launches now :).
* Fixed Licensing URL for HTTPS.
* Added extra SSH Connection error handling.
* Fixed UI bug that caused ‘Weekly Schedule’ to disappear.
* Fixed: VMs with ‘:’ in name were failing.
* Fixed: Placer holder context menu did not work.
* Console Formatting for % fixed.

###### Version 2.3.26

* Fixed issue with Invalid run history items causing Job not to load from the Server.

###### Version 2.3.23

* Fixed: Snapshot only Backups no longer require a saved Location.
* Fixed: Restore logic to simplify configuration.
* Fixed: VMs with ‘:’ in name were failing.
* Fixed: Placer holder context menu did not work.
* Fixed: Create Job UI startup crash.

###### Version 2.3.16

* Fixed Licensing URL for HTTPS.
* Fixed UI bug that caused ‘Weekly Schedule’ to disappear.
* Released to Stable.
* Fixed issues with Replications always failing.
* Fixed long UI update delay when running jobs inside the main UI.
* Saved Locations now serves as the defining point for all ‘Destinations’ – Quite a big change 🙂
* Changes to the execution of Chained Jobs to be more ‘Contained’
* Fixed ‘bitness’ of Job Runner,  which causing x86 systems to fail.
* UI Updates to the Hypervoisor Explorer.
* Changed Service API Architecture for better job management.
* One or two fixes to the Restore UI
* Ability to ‘chain’ jobs using the ‘Pre’, ‘Post’ Tasks feature. This lets you launch one job after another should it be required.
* **MORE** UI fixes, Clean Up
* Codebase reworked to allow for future modernization.
* Fixes for some situations where delta files were not exporting fully.
* Overhaul of the ‘Extract’ interface to make things simpler and more efficient. Now, more types of backups can be opened  XVA (inc GZip / ZStd) and Xackup compressed files.
* Added ability to the Clean-Up tools to find ‘zombie’ VDIs. i.e Those that are plugged to the Comtrol Domain.
* Fixed problem when trying to Extract files from a backup that was created with ZSTD compression (i.e XCP-ng 8.1 etc)

###### Version 2.2.5 (Stable Release)

* Fixed a number of UI bugs
* Resolved crash when testing Email configuration.
* Shutdown message improvements for clarity.
* Fix for browsing ‘Restore’ locations that was causing a serious crash.
* A number of bug fixes for Differential Replications
* Better command of ‘Temporary Files’ fallback when doing direct transfers.
* Custom Temporary File location.
* BIG internal changes that hopefully you won’t even notice 🙂
* More reliable (maybe faster) XenServer controlled backups etc. Feedback would be appreciated. This is likely to fix many of the stuck or randomly failing Jobs of this type.

###### Version 2.1.123

* 2.1.123 – Automatic fall back when delta VDI cannot be transferred correctly.
* 2.1.123 – Fixes for errors during Network Mapping in UI and Processing time
* 2.1.123 – Improved (possibly) NFS/CIFS handling.
* 2.1.122 – Fix for crash on Migration screen, ugh!
* 2.1.121 – Added auto forcing new Master snapshots when VM has different configuration i.e New or Changed Disk sizes.
* 2.1.121 – Fixed issue where opening settings may cause a crash.
* 2.1.120 – Fixed some ‘Template’ issues on Replication
* 2.1.120 – Fixed some Job editing and creation bugs with Saved Servers.
* 2.1.19 – ALPHA of Xackup Landscape, this wont do much right now, but some items have shown up in the UI.
* 2.1.19 – XenExplorer added to allow in-depth navigation of your Hypervisor infrastructure. Aimed at the more technical people needing specific information.
* 2.1.19 – Fixed ‘Auto Abort’ which was not meant to be activated just yet.
* 2.1.19 – Improved Clean-Up Wizard to search for orphaned VDI’s and stuck Tasks.

###### Version 2.1.117

* 2.1.117 – Extra fixes for release.
* 2.1.116 – A few changes to the Details Viewer.
* 2.1.115 – Many minor fixes and optimisations.
* 2.1.115 – Added a monitoring process to check for stalled transfers. Currently can only detect, soon can Abort stuck jobs.
* 2.1.115 – Reorganised the ‘Clean Up Wizard’ to enhance usability.
* 2.1.115 – Removed Job database causing corruption in a number of cases
* 2.11.13 – Reintroduced requirement to Run As Administrator to fix Scheduling issues.
* 2.1.112 – Fixed an issue with Wizards updating asynchronously
* 2.2.112 – Fixed an issue where Schedules were being removed instead of Paused.
* 2.1.111 – Fixed a few UI update issues when Jobs finished
* 2.1.111 – Added longer connection Timeouts and shorter Keep Alive duration the the SSH Connections

###### Version 2.1.109

* 2.1.109 – Reverted Job database upgrade due to loading issues.
* 2.1.107 – Fixed an error loading older Job Statuses
* 2.1.106 – Fixed an error during Restore Jobs.
* 2.1.105 – Fixed an issue where there was contention for Log File access.
* 2.1.104 – Enabled legacy SSL3 to connect to older XenServers.
* 2.1.103 – Log screen updates correctly when monitoring Job interactively.
* 2.1.102 – Fixed regression causing the Task Scheduler to fail to launch jobs.
* 2.1.101 – General fixes for Cleaning VDI / VMs when Jobs failed to complete.
* 2.1.101 – “Resume failed Job” option which can run a job and only run the failed/aborted VMs in that Job.
* 2.1.101 – General QA and UI fixes.
* 2.1.99 – Improved ‘Extraction’ utility with Linux based backups.
* 2.1.98 – Added SSH Private Key Authentication options
* 2.1.97 – Loss of Virtual machine selection on loading Job wizards is fixed.
* 2.1.96 – Retry mechanism will attempt to process failed VMs up to 3 times
* 2.1.96 – Redesigned Jobs wizards to be more robust.
* 2.1.96 – Better detection when a Pool Master changes.
* 2.1.95 – New method to detect Restored VMs as some XenServer are not returning Refs as desired.
* 2.1.93 – Fixed browsing UI in NFS / CIFS / SR etc.
* 2.1.93 – Minor UI fixes and updates.
* 2.1.93 – Fixed possible error when restoring True Differentials.
* 2.1.92 – Cleaned restoration process logging.
* 2.1.91 – Fixed an issue where screen did update when ‘Monitoring’ a job.
* 2.1.91 – Simplified logging. All file based and can be tailed using external tools.
* 2.1.89 – Resolved some messy issues with XenServer 8.0. True Differentials will require a temporary file to be created on the Xackup server, until further notice.
* 2.1.89 – Fixed a bug where CIFS credentials were not being passed correctly.
* 2.1.88 – Better detection of Restored / Migrated VMs when a Xen Task gets stuck in Pending mode.
* 2.1.87 – Tasks ending with Success or Pending will be successful thus allowing the Xackup jobs to complete more robustly.
* 2.1.85 – Fixed an issue where settings would not be reloaded correctly by the Xakup Job API Service.

###### Version 2.1.84

* 2.1.84 – Fixed a nasty issue where XenServer controlled backups might end up in the wrong location.
* 2.1.84 – Change SFTP routines to avoid possible connection timeout.
* 2.1.82 – Allowed Xackup API to run as a console app if the Service is not available.
* 2.1.80 – Fixed a number of issues with Replication where Tasks causing failures.
* 2.1.79 – Fixed Fatal Error when attempting to clean a XenServer Managed backup location that has never be created before.
* 2.1.78 – Removed multi-retry on failed jobs until a better solution can be found.
* 2.1.78 – Final job status will be correct on failures.
* 2.1.78 – Fixed issues while trying to find Backup files to restore. This was causing a lot of confusion.
* 2.1.76 – Repackaged installer to avoid issues on older Operating Systems.
* 2.1.75 – Warning status wont cause Job to be retried.

###### Version 2.1.74 (BETA)

* 2.1.73 – Improved status reporting of ‘Retry’ failed VM feature.
* 2.1.73 – Added automatic retry feature to VM Processing if it fails.
* 2.1.73 – Minor UI fixes for layout issues.
* 2.1.72 – Weird deployment issue should be solved.
* 2.1.70 – Fixed the _No Host with Address =_ error.
* 2.1.68 – Fixed confusing use of Saved Locations in Job wizards.
* 2.1.67 – Fixed bug where the Extract Wizard could not be closed.
* 2.1.66 – Fixed a bug stopping new Saved Locations to be added.
* 2.1.65 – Changed Job Server to run as Network Service.
* 2.1.64 – Fixed a bug causing “Input string was not in a correct format” when using XenServer and not XCP-ng
* 2.1.63 – Added ‘Check All’ ,’Check Node’ and ‘Toggle’ when selecting VMs to process
* 2.1.62 – Better Job Server implementation.
* 2.1.62 – Restored concurrent VM processing.
* 2.1.61 – Added ability to search Logs in Job Details view
* 2.1.60 – Fixed ‘Monitor’ option restoring Processed VMs
* 2.1.60 – No more concurrent VM processing. This lead to many XenServer related issues.
* 2.1.59 – Better handling of the mysterious ‘**HANDLE_INVALID – task**‘ error that some people are dealing with.
* 2.1.58 – Made cancelling XenServer controlled Jobs more reliable
* 2.1.58 – Fixed bug with Migrations / Replications failing
* 2.1.57 – Fixed error popup when creating new Jobs
* 2.1.57 – Fixed loss of Saved password for Saved Servers
* 2.1.56 – Various UI fixes in new Non-Linear Wizards
* 2.1.56 – Jobs now run in a separate process, enabling the main UI to be closed and Jobs will keep running. Allows viewing and control of Scheduled Tasks also.
* 2.1.54 – Added Non-Linear Job Wizards (Please do help us test these).
* 2.1.54 – Improvements to Dynamic Filter.
* 2.1.53 – Fixed some Path selection issues in the SSH Folder browser for Restores and Backups.

###### Version 2.1.52

* 2.1.52 – Simplified ‘Location’ setup as some people were still experiencing issues with paths changing.
* 2.1.50 – Fixed issue with ‘Invalid Interval’ error when setting some types of Schedule.
* 2.1.49 – Fixed issue where the Backup path might change unexpectedly when stepping through the Jobs Wizard.
* 2.1.48 – Added clean up for old .processing file. Processing files older than a week will be automatically deleted when a Job runs.
* 2.1.48 – Fixed missing Weekly / Monthly Scheduling UI
* 2.1.47 – Fixed issue where restored VMs could not be started without a “Toolstack Reset”.  Thanks for the tip! You know who you are.

###### Version 2.1.46

* 2.1.46 – Fixed an issue caused a crash when a Username or Password was empty for Email settings.
* 2.1.45 – Added customisation to ‘_Mount’_ commands as it appears more flexibility was required.
* 2.1.45 – Fixed setting of Primary and Secondary default Email addresses.
* 2.1.44 – Rebuilt installer with .NET 4.6.1 support.
* 2.1.43 – Experimenting with Gantt Charts to view Backup / Replication Jobs on a timeline. Useful for detecting overlapping Jobs.
* 2.1.43 – Change to internal architecture.
* 2.1.43 – Latest XenServer API.
* 2.1.43 – Added ‘ntlmv2’ to the CIFS mounting commands.

###### Version 2.1.42

* 2.1.42 – Removed MAC Address preservation on Restore as it rarely works as expected.
* 2.1.42 – Added ability to create and restore Job database backups. Also, old Jobs database backup reminder on shutdown.
* 2.1.42 – More tweaks to the application settings system.
* 2.1.40 – Fixed error when trying to connect to the Fungusware Licensing Server that appeared in 2.1.37
* 2.1.37 – Fixed a critical error removing snapshots in Snapshot only Backups.
* 2.1.37 – **Changed the Application Settings storage method AGAIN ! You MIGHT lose some settings like ‘Saved Servers’ but NOT your Jobs.**
* 2.1.36 – Reworked Email code to hopefully avoid missed ‘Job Completion’ emails.
* 2.1.36 – Changed code to avoid possible left over snapshot VDI chains in some circumstances.
* 2.1.35 – XenServer controlled Exports now support ignoring invalid SSL Certificates on the XenServer.
* 2.1.34 – **Changed the Application Settings storage method to make it more reliable — You will unfortunately lose some settings like ‘Saved Servers’ but NOT your Jobs.**
* 2.1.34 – Fixed failure to restore Backups using the old “xdiff” format.
* 2.1.34 – Added ‘Saved Locations’ so that backup locations can be predefined making it easier to use the same Location across Jobs.
* 2.1.34 – Unstable restores, on Large VMs, similar to below.

###### Version 2.1.32

* 2.1.32 – Unstable transfers on large VM when using a standard backup. If you we’re getting Crashes or Hung Transfers this will likely fix it.
* 2.1.30 – Fixed an issue where connecting to a server using port 443 would fail with no workaround
* 2.1.30 – Fixed an issue in TruDiff where transfer where not using the HTTPS protocol when port 443 was specified.
* 2.1.29 – New Console for running unattended Tasks, the standard windows Console could freeze unexpectedly.
* 2.1.29 – Improved loading/saving of Jobs.
* 2.1.29 – Changed to run with Administrative privileges to avoid any confusion of over crating Scheduled Tasks.
* 2.1.28 – Fixed issue where SSH credentials might not be updated correctly causing connection failure when running, but NOT during connection Testing.
* 2.1.28 – Minor UI Tweaks
* 2.1.24 – Totally new Logging system, fault tracking and support more streamlined
* 2.1.24 – Better handling of Email failures
* 2.1.24 – Introduction of the ‘Clean Up’ Wizard which can help remove unwanted or leftover Snapshots created by Xackup.

###### Version 2.1.22

* Fixes to UI for concurrent Backups
* Improved License sharing for non-Admin users.
* Fixed potential Freeze when sending Emails
* Re-Added Pre and Post tasks.

###### Version 2.1.20

* Added support for concurrent Backups/Migrations/Replications to increase Network Utilisation
* UI Changes to simplify layout and support Concurrent Backups/Migrations/Replications
* Non-Differential Replications will now be created as VMs not Templates
* Various Bug Fixes
* Initial tests on XCP-ng passed.

###### Version 2.1.19

* Fixed possible errors when trying to mount SR, Mounts or NFS Shares.
* Fixes for the troubled 2.1.17 build.

###### Version 2.1.16

* Fixed Retention setup in Snapshot only mode
* Fixed Monthly Scheduling drop downs
* Jobs are stored centrally to fix concurrency issues.
* Fixed error where Restores might fail.

###### Version 2.1.11

* Elevated to Early Access

###### Version 2.1.10 (BETA)

* Reworked Data Transfer engine.
* **True Differential Backup.**
* **True Differential Replication.**
* Fixed Job Import issues.
* 2.1.3 : Fixed Backup Sub Location issues.
* 2.1.3 : Fixed issues caused by failing Restorations.
* 2.1.3 : Monthly Scheduling.
* 2.1.4 : Advanced Filtering. Name , Description, State, Tags, Negative Filters.
* 2.1.5 : Fixed failing connections to servers using Ports other than 80
* 2.1.5 : Reintroduced HTTPS Connections (oops)
* 2.1.5 : Reintroduced old style differentials as ‘Deduplication’ feature. Some of you really liked it!
* 2.1.6 : Enhancements to charts.
* 2.1.6 : Fixed ‘Repeat for’ functionality in Schedules.
* 2.1.8 : Added viewer for Release Notes.
* 2.1.8 : Fixed possible server disconnection when Backups ran for an extended period of time.
* 2.1.9 : Fixed Replication failure issues. DUH!
* 2.1.10 : **Fixed DUPLICATE_VM when using the Preserve MAC address options.**
* 2.1.11 : Fixed issue with VMs with ‘.’ in the names.

###### Version 2.0.22

* API support for XenServer 7.2
* Added ‘Domain’ option for connecting to mounted locations. Fixes lots of log in issues for XenServer controlled backups
* Fixed processing information when backing up to the mounted locations.
* Fixed scheduled tasks that failed to run after upgrading to v2.0
* Resolved a situation that caused processing runs to become stuck after failing, meaning the fallback methods of processing could not run.
* Added UNC Credentials for Windows shares to avoid permissions issues.
* Fixed mounting of shared locations where domain credentials were required.
* Experimental version of Xackup Server is now mostly functional.

###### Version 2.0.19

* Added an option to change the Preferred transfer method in Migrations to accounts for error occurring in XenServer 6.5 installs.
* Added some tweaks to clean up the UI.

###### Version 2.0.16

* When Restoring, Fixed issue where a VM was started before its NICs were set, causing an confusing error message.
* Simplified connecting to servers
* Fixed handling of XenServer’s self signed certificate to allow proper HTTPS connections.
* Reworked Migration logic to provide a smoother experience.

###### Version 2.0.13

* Reworked the Migration processing logic for better operation when running Migrations on the same server.
* Removed the need for choosing a transfer method. Xackup will try the optimal method and fallback if it does not work.
* Improved Restore functionality
* Improved Naming methods for Restores and Migration
* Fixed ‘Pending’ tasks in XenServer when performing Snapshot only backups.
* Removed XenServer clean up routines as they cause numerous issues.
* JobÂ History and Logging improved and always enabled.
* UI Changes.
* **CreateÂ VHD files from backups for mounting in Windows.**
* Extract single/ multiple Files and Folders from a Backup.
* Fix missing Log data after processing completes. (Sorry missed that one from the RC)

###### Version 2.0.10 / 1.1.15

* Fix issue where Xackup refused to use the Secure HTTP Port for Testing and Job configuration.

###### Version 2.0.9

* Fixed running of multiple Jobs that used mounted locations.
* Changed Snapshot settings to enable higher VM access. Not taking a Snapshot is now an option feature.

###### Version 2.0.8

* Implemented Licensing via Proxy Server.
* Fixed errors due to ‘Task Reference Missing or Deleted’.
* 90% new Icons in UI.
* Various minor bug fixes.

###### Version 2.0.6

* Total architecture change to allow for FUTURE Client-Server configuration, API access and Remote management of Jobs.
* Better Job result tracking. XenServer will now determine if the job encountered an error, rather than level data transfer. See 1.1.7 Notes.
* Clearer Licensing information.
* Better ‘Saved Server’ configuration.
* General Bug fixes.

* * *
