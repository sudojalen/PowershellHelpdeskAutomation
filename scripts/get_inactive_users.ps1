# get_inactive_users.ps1

param (
    [int]$DaysInactive = 30
)

Import-Module ActiveDirectory

$cutoffDate = (Get-Date).AddDays(-$DaysInactive)

$inactiveUsers = Get-ADUser -Filter * -Properties LastLogonDate |
    Where-Object { $_.Enabled -eq $true -and $_.LastLogonDate -lt $cutoffDate } |
    Select-Object Name, SamAccountName, LastLogonDate

if ($inactiveUsers) {
    Write-Host "`nInactive users (not logged in for $DaysInactive+ days):`n" -ForegroundColor Yellow
    $inactiveUsers | Format-Table -AutoSize
} else {
    Write-Host "✅ No inactive users found." -ForegroundColor Green
}
