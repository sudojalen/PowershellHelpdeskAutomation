# check_disk_space.ps1

$thresholdGB = 10

# Get all file system drives
$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    $freeGB = [math]::Round($drive.Free / 1GB, 2)
    $usedGB = [math]::Round($drive.Used / 1GB, 2)

    Write-Host "`nDrive $($drive.Name):"
    Write-Host "  Free: $freeGB GB"
    Write-Host "  Used: $usedGB GB"

    if ($freeGB -lt $thresholdGB) {
        Write-Host "  ⚠️ WARNING: Low disk space on drive $($drive.Name)!" -ForegroundColor Red
    }
}
