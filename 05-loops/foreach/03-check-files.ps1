# #############################################################################
# Example 3 — Check multiple files
# Real-life scenario: Verify that required application/configuration files exist.
# #############################################################################

$files = @(
    "C:\App\config.json",
    "C:\App\application.log",
    "C:\App\app.exe"
)

foreach ($file in $files) {
    if (Test-Path $file -PathType Leaf) {
        Write-Output "Found: $file"
    }
    else {
        Write-Output "Missing: $file"
    }
}
