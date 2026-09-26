# #############################################################################
# Example 11 — Create monthly backup folders
# Real-life scenario: Prepare a folder structure for monthly backups.
# #############################################################################

$backupRoot = "C:\Backups"

for ($month = 1; $month -le 12; $month++) {
    $folder = Join-Path $backupRoot ("Month-{0:D2}" -f $month)

    New-Item -Path $folder -ItemType Directory -Force | Out-Null
    Write-Output "Created backup folder: $folder"
}
