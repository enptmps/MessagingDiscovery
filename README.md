MessagingDiscovery
======
A collection of messaging discovery scripts and functions that will ultimatly become part of a larger module

<br />
#### Get-NonMatchingUPNtoSMTP.ps1
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

#### DLEXPORT.PS1

#### Get-EASDeviceReport.ps1

#### MBXStats.ps1

#### Get-PubilcFolderReplicationReport.ps1

#### ImportDL365.ps1

#### ImportMembers365.ps1

#### MbxPermissions.ps1

#### Get-VirDirInfo.ps1
