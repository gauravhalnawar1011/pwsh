# #############################################################################
# Example 4 — Find large files
# Real-life scenario: Identify large files consuming server disk space.
# #############################################################################

$files = Get-ChildItem "C:\Temp" -File -ErrorAction SilentlyContinue

foreach ($file in $files) {
    if ($file.Length -gt 100MB) {
        Write-Output "Large file: $($file.FullName) - $([math]::Round($file.Length / 1MB, 2)) MB"
    }
}
