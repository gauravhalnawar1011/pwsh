# #############################################################################
# Example 5 — Find empty files
# Real-life scenario: Detect empty files that may indicate failed jobs or incomplete processing.
# #############################################################################

$files = Get-ChildItem "C:\Temp" -File -ErrorAction SilentlyContinue

foreach ($file in $files) {
    if ($file.Length -eq 0) {
        Write-Output "Empty file: $($file.FullName)"
    }
}
