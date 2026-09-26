# #############################################################################
# Example 2 — Countdown before starting a deployment
# Real-life scenario: Give an operator a short countdown before an action.
# #############################################################################

for ($i = 5; $i -ge 1; $i--) {
    Write-Output "Deployment starts in $i seconds..."
    Start-Sleep -Seconds 1
}

Write-Output "Deployment started."
