#PowerShell-CheckIfMailboxIsIno365ForGraphCode.ps1

#Install-Module -Name ExchangeOnlineManagement  # - Run only one time

#Import-Module ExchangeOnlineManagement

Connect-ExchangeOnline -UserPrincipalName myadmin@contoso.onmicrosoft.com
$upn = "myuser@contoso.com"
$Result = (Get-Recipient -Identity $upn -ErrorAction Stop).RecipientTypeDetails
$Result
if ($Result -eq "UserMailbox") {
    Write-Output "Mailbox is in o365. "
} else {
    Write-Output "Mailbox is NOT in o365. Graph does not work against on-premesis mailboxes. Exiting."
    exit
}
