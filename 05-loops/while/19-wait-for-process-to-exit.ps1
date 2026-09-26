# #############################################################################
# Example 19 — Wait for a process to finish
# Real-life scenario: Wait for an installer or deployment process to complete.
# #############################################################################

$processName = "notepad"

$process = Get-Process -Name $processName -ErrorAction SilentlyContinue

while ($null -ne $process) {

    Write-Output "$processName is still running..."
    Start-Sleep -Seconds 2

    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
}

Write-Output "$processName has finished."
