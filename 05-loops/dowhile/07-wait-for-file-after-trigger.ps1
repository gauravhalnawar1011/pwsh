# #############################################################################
# Example 7 — Trigger an operation and wait for a file
# Real-life scenario: Start a process that should generate a file, then wait for the file.
# #############################################################################

$file = "C:\Temp\job-complete.txt"

# Trigger the operation here.
Write-Output "Starting job..."

do {
    Start-Sleep -Seconds 5

    if (Test-Path $file -PathType Leaf) {
        Write-Output "Completion file found."
    }
    else {
        Write-Output "Waiting for completion file..."
    }
}
while (-not (Test-Path $file -PathType Leaf))
