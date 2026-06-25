# Script: DHCP-Report.ps1
# Purpose: Export active DHCP leases to CSV for auditing
 $DhcpServer = "server1.network.local"
 $ExportPath = "C:\DHCP-Leases-Report.csv"

Get-DhcpServerv4Lease -ComputerName $DhcpServer | Select-Object IPAddress, ClientId, HostName, AddressState, LeaseExpiryTime | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Host "[+] DHCP Report exported successfully to $ExportPath" -ForegroundColor Green
