MessagingDiscovery
======
A collection of messaging discovery scripts and functions that will ultimatly become part of a larger module

<br />

## Get-NonMatchingUPNtoSMTP.ps1
Combines get-recipient and get-user into a custom object that outputs
FirstName, LastName, UPN, PrimarySMTPAddress where UPN and PrimarySMTPAddress do not match

Unlimited resultsize is enabled by default, and filtering for non matching UPN to SMTP is included by default
```powershell
./Get-NonMatchingUPNtoSMTP.ps1
```
Example Output
```powershell
FirstName LastName PrimarySMTPAddress            UPN
--------- -------- ------------------            ---
Bob       Builder  bbuilder@enpt.onmicrosoft.com !bbuilder@Enpointe.com
Telly     Tubby    ttubby@mylocalness.com        notmatching@notlocal.com
```
<br />

## DLEXPORT.PS1
build a file of all on prem DLs 

## Get-EASDeviceReport.ps1

## MBXStats.ps1

## Get-PubilcFolderReplicationReport.ps1

## ImportDL365.ps1
Import the Onprem DL to 365 DG's

## ImportMembers365.ps1
import members into the DGs in 365

## MbxPermissions.ps1
7-15-16 edits will remove mailboxes that don’t have these permissions and added into the report and added more mailbox permissions.
This is helpful because if mailboxes have these permissions they should be migrated over to Office 365 as a group to retain these permissions.

```powershell
./MbxPermissions.ps1
```

Default Output
```code
C:\Temp\PermissionExport.txt
```
<br />

## Get-VirDirInfo.ps1

## Retention report
Collect retention information

## Get-connectors.ps1
Need to vet this script out for what we need and dont need.

## PF2013Discovery.ps1
Need to vet this

