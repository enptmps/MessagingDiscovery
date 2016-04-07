<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-MBXPermissions
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
       # [Parameter(Mandatory=$true,
       #            ValueFromPipelineByPropertyName=$true,
       #            Position=0)]
       # $Param1,

       # # Param2 help description
       # [int]
       # $Param2
    )

    Begin
    {
        $OutputCollection = @()
        $Mailboxes = Get-Mailbox -ResultSize Unlimited # | Select Identity, Alias, DisplayName, DistinguishedName
        Write-Verbose "Found $($mailboxes.count) Malboxes to process through"
    }
    Process
    {
        ForEach ($Mailbox in $Mailboxes) {
            $SendAs = Get-ADPermission $Mailbox.DistinguishedName | ? {$_.ExtendedRights -like "Send-As" -and $_.User -notlike "NT AUTHORITY\SELF" -and !$_.IsInherited} | % {$_.User}
            $FullAccess = Get-MailboxPermission $Mailbox.Identity | ? {$_.AccessRights -eq "FullAccess" -and !$_.IsInherited} | % {$_.User}

        $outputObject = "" | Select DisplayName, Alias, FullAccess, SendAs
        $outputObject.DisplayName = $Mailbox.DisplayName
        $outputObject.Alias  = $Mailbox.Alias
        $outputObject.FullAccess = $FullAccess
        $outputObject.SendAs = $SendAs
        
        $OutputCollection += $outputObject
    }
    End
    {
        Return $OutputCollection
        Write-Verbose "Output collection contains $($outputCollect.count) objects"
    }
}

#$OutFile = "C:\Temp\PermissionExport.txt"
#"DisplayName" + "," + "Alias" + "," + "Full Access" + "," + "Send As" | Out-File $OutFile -Force
 


 
           #   $Mailbox.DisplayName + "," + $Mailbox.Alias + "," + $FullAccess + "," + $SendAs | Out-File $OutFile -Append
}
