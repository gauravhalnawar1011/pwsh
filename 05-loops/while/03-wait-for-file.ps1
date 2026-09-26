# #############################################################################
# Example 3 — Wait for a file to appear
# Real-life scenario: Wait for another process or application to generate a file.
# #############################################################################

$file = "C:\Temp\deployment-complete.txt"

while (-not (Test-Path $file -PathType Leaf)) {
    Write-Output "Waiting for $file..."
    Start-Sleep -Seconds 5
}

Write-Output "File found. Continuing..."
