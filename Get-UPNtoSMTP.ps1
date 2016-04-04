Function Get-UPNtoSMTP
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([PSObject])]
    Param
    (
        [Parameter(
            Mandatory=$false
        )]
        [string]$ResultSize = 'Unlimited'
    )

    Begin
    {
       $OutputCollection = @()
       $Users = Get-User -resultsize $ResultSize -filter *
       Write-Verbose "found $($users.count) users"
       $Recip = Get-Recipient -RecipientTypeDetails UserMailbox -resultsize $ResultSize -filter * 
       Write-Verbose "found $($recip.count) recipients"
    }
    Process
    {
        $Recip | ForEach-Object{
        
        $recipientObject = $_
        $userObject = Get-User $recipientObject.Identity
    
#        New-Object -TypeName PSObject -Property @{
#            FirstName = $user.firstname
#            LastName = $user.lastname
#            UPN = $user.userprincipalname
#            PrimarySMTPAddress = $recipient.primarysmtpaddress
#            }
        $outputObject = "" | Select FirstName, LastName, PrimarySMTPAddress, UPN
        $outputObject.FirstName = $userObject.FirstName
        $outputObject.LastName  = $userObject.LastName
        $outputObject.PrimarySMTPAddress = $recipientObject.primarysmtpaddress
        $outputObject.UPN = $userObject.userprincipalname
        
        $OutputCollection += $outputObject
        }
    }
    End
    {
        Return $OutputCollection
        Write-Verbose "Output collection contains $($outputCollect.count) objects"
    }
}
