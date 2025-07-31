# memory_usage.ps1

# This script retrieves the top 10 processes by memory usage and 
# displays their names, IDs, and memory usage in MB.

Get-Process |
Sort-Object -Descending WS |
Select-Object -First 10 Name, Id, @{Name="Memory(MB)";Expression={[math]::Round($_.WS/1MB, 1)}} |
Format-Table -AutoSize
