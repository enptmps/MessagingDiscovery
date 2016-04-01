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
       $Users = get-eouser -resultsize $ResultSize -filter *
       $Recip = get-eorecipient -RecipientTypeDetails UserMailbox -resultsize $ResultSize -filter * 
    }
    Process
    {
        $Recip | ForEach-Object{
        
        $recipientObject = $_
        $userObject = get-eouser $recipientObject.Identity
    
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
    }
}
