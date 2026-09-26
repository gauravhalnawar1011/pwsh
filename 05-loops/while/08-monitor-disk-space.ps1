# #############################################################################
# Example 8 — Monitor disk space until it becomes safe
# Real-life scenario: Wait for disk usage to fall below a defined threshold.
# #############################################################################

$drive = "C"
$minimumFreeGB = 10

$volume = Get-Volume -DriveLetter $drive -ErrorAction SilentlyContinue

while ($null -ne $volume -and ($volume.SizeRemaining / 1GB) -lt $minimumFreeGB) {

    $freeGB = [math]::Round($volume.SizeRemaining / 1GB, 2)

    Write-Output "WARNING: Only $freeGB GB free on drive $drive`:."
    Write-Output "Waiting before checking again..."

    Start-Sleep -Seconds 10

    $volume = Get-Volume -DriveLetter $drive -ErrorAction SilentlyContinue
}

if ($null -eq $volume) {
    Write-Output "Drive $drive`: not found."
}
else {
    Write-Output "Drive $drive`: has enough free space."
}
