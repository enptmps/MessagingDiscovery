MessagingDiscovery
======
A collection of messaging discovery scripts and functions that will ultimatly become part of a larger module

<br />
#### Get-UPNtoSMTP
Combines get-recipient and get-user into a custom object that outputs
FirstName, LastName, UPN, PrimarySMTPAddress

Unlimited resultsize is enabled by default
```powershell
./Get-UPNtoSMTP
```

Limit result size
```powershell
./Get-UPNtoSMTP -ResultSize 200
```

Allows us to do quick compares against UPN and PrimarySMTPAddress for Office365 readiness by using a simple Where-Object filter
Shows users with mismatched UPN to PrimarySMTPAddress mapping
```powershell
./Get-UPNtoSMTP | ?{$_.UPN -ne $_.PrimarySMTPAddress}
```

#### DLEXPORT.PS1
