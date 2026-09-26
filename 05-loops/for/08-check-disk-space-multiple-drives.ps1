# #############################################################################
# Example 8 — Check disk space on multiple drives
# Real-life scenario: Perform a basic disk-space check across known drive letters.
# #############################################################################

$drives = "C", "D", "E"

for ($i = 0; $i -lt $drives.Count; $i++) {
    $drive = $drives[$i]
    $volume = Get-Volume -DriveLetter $drive -ErrorAction SilentlyContinue

    if ($null -eq $volume) {
        Write-Output "$drive`: drive not found."
        continue
    }

    Write-Output "$drive`: $([math]::Round($volume.SizeRemaining / 1GB, 2)) GB free"
}
