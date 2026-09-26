# #############################################################################
# Example 9 — Check disk space on multiple drives
# Real-life scenario: Monitor free space before a deployment or backup operation.
# #############################################################################

$drives = "C", "D", "E"

foreach ($drive in $drives) {
    $volume = Get-Volume -DriveLetter $drive -ErrorAction SilentlyContinue

    if ($null -eq $volume) {
        Write-Output "$drive`: Drive not found."
        continue
    }

    $freeGB = [math]::Round($volume.SizeRemaining / 1GB, 2)

    if ($freeGB -lt 10) {
        Write-Output "$drive`: WARNING - $freeGB GB free"
    }
    else {
        Write-Output "$drive`: OK - $freeGB GB free"
    }
}
