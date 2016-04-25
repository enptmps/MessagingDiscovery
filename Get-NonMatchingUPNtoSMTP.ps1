#Requires -Version 2.0
function Get-UPNtoSMTP
{

    [CmdletBinding()]
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

        # Test for Command presence
        if (!(Get-Command Get-User -errorAction SilentlyContinue))
        {
            Write-Error "Cannot detect Exchange specific cmdlets"
            break
        }
        
        $OutputCollection = @()
        $Recip = Get-Recipient -RecipientTypeDetails UserMailbox -resultsize $ResultSize -filter * 
        Write-Verbose "found $($recip.count) recipients"
    }
    Process
    {
        $Recip | ForEach-Object{
        
        $recipientObject = $_
        $userObject = Get-User $recipientObject.Identity
    
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

Get-UPNtoSMTP -verbose | Where-Object {$_.upn -ne $_.primarySMTPAddress}
