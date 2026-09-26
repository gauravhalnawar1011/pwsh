# #############################################################################
# Example 18 — Monitor a log until deployment completes
# Real-life scenario: Wait for a deployment log to contain a completion message.
# #############################################################################

$logFile = "C:\Temp\deployment.log"
$successMessage = "Deployment completed"
$attempt = 0
$maxAttempts = 10
$completed = $false

do {
    $attempt++

    if (Test-Path $logFile -PathType Leaf) {
        $completed = Select-String `
            -Path $logFile `
            -Pattern $successMessage `
            -SimpleMatch `
            -Quiet
    }

    if (-not $completed -and $attempt -lt $maxAttempts) {
        Write-Output "Deployment not complete. Checking again..."
        Start-Sleep -Seconds 5
    }
}
while (-not $completed -and $attempt -lt $maxAttempts)

if ($completed) {
    Write-Output "Deployment completed successfully."
}
else {
    Write-Output "Deployment did not report completion."
}
