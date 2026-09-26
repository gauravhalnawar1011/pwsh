# #############################################################################
# Example 7 — Wait for a process to start
# Real-life scenario: Wait for an application process before performing a health check.
# #############################################################################

$processName = "notepad"

while ($null -eq (Get-Process -Name $processName -ErrorAction SilentlyContinue)) {
    Write-Output "Waiting for $processName..."
    Start-Sleep -Seconds 2
}

Write-Output "$processName is running."
