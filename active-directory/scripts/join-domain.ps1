poweshell


<#
.SYNOPSIS
   Automated script to join a Windows client machine to the Lab Active Directory domain
.DESCRIPTION
   Sets the primary DNS to the Domain Controller and joins the machine to the specified domain
   Requires administrative privileges and a system reboot afterwards.

>#

# Define variables
$DomainName = "lab.local"
$DnsServerIP = "192.168.1.10"

Write-Host "Configuring primary DNS to Domain Controller ($DnsServerIP)..." -ForegroundColor Cyan
$InterfaceIndex = (Get-NetAdapter | Where-Object {$_.Status -eq "Up"}).InterfaceIndex
Set-DnsClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses $DnsServerIP


Write-Host "Joining domain: $DomainName..." -ForegroundColor Cyan
# This prompt will ask for domain adminstration credentials
Add-Computer -DomainName $DomainName -Credential (Get-Credential) -Restart

