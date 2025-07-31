# network_diagnostics.ps1

# This script performs basic network diagnostics by checking connectivity to a common website
# and displaying DNS server addresses.

Test-Connection google.com -Count 4
Get-DnsClientServerAddress | Format-Table
