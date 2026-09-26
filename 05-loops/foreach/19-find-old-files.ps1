# #############################################################################
# Example 19 — Find old files across a directory
# Real-life scenario: Identify files that may be candidates for cleanup or archiving.
# #############################################################################

$limit = (Get-Date).AddDays(-30)
$files = Get-ChildItem "C:\Logs" -File -ErrorAction SilentlyContinue

foreach ($file in $files) {
    if ($file.LastWriteTime -lt $limit) {
        Write-Output "Old file: $($file.FullName)"
        Write-Output "Last modified: $($file.LastWriteTime)"
    }
}
