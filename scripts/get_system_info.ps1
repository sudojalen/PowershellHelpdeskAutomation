# get_system_info.ps1

Write-Host "System Information Report" -ForegroundColor Cyan
Write-Host "========================="

# Basic info
$computerName = $env:COMPUTERNAME
$username = $env:USERNAME
$os = Get-CimInstance Win32_OperatingSystem

Write-Host "`nComputer Name: $computerName"
Write-Host "Username: $username"
Write-Host "Operating System: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"

# Uptime
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Host "System Uptime: $($uptime.Days) days, $($uptime.Hours) hrs, $($uptime.Minutes) mins"

# CPU info
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
Write-Host "`nCPU: $($cpu.Name)"

# RAM
$ram = Get-CimInstance Win32_ComputerSystem
$ramGB = [math]::Round($ram.TotalPhysicalMemory / 1GB, 2)
Write-Host "Installed RAM: $ramGB GB"

# IP Address (get first usable)
$ip = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet','Wi-Fi' -ErrorAction SilentlyContinue | Where-Object {$_.IPAddress -notlike '169.*'} | Select-Object -First 1).IPAddress
Write-Host "`nIP Address: $ip"

# MAC Address (first active adapter)
$mac = (Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object -First 1).MacAddress
Write-Host "MAC Address: $mac"
