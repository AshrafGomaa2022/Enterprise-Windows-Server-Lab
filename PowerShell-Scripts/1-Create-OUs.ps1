# Script: Create-Users.ps1
# Purpose: Create the HR user 'ashraf' in the HR OU
Import-Module ActiveDirectory
 $DomainDN = (Get-ADDomain).DistinguishedName
 $OUPath = "OU=HR,$DomainDN"
 $Password = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force

 $Username = "ashraf"
if (!(Get-ADUser -Filter {SamAccountName -eq $Username})) {
    New-ADUser -Name $Username -SamAccountName $Username -UserPrincipalName "$Username@network.local" -Path $OUPath -AccountPassword $Password -Enabled $true
    Write-Host "[+] User '$Username' created in HR OU." -ForegroundColor Green
} else {
    Write-Host "[-] User '$Username' already exists." -ForegroundColor Yellow
}
