# #############################################################################
# Example 2 — Countdown before an operation
# Real-life scenario: Give users a countdown before starting a maintenance task.
# #############################################################################

$i = 5

while ($i -ge 1) {
    Write-Output "Starting in $i seconds..."
    Start-Sleep -Seconds 1
    $i--
}

Write-Output "Operation started."
