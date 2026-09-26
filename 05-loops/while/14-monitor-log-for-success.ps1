# #############################################################################
# Example 14 — Monitor a log file for a success message
# Real-life scenario: Wait for an application or deployment log to report completion.
# #############################################################################

$logFile = "C:\Temp\deployment.log"
$successMessage = "Deployment completed"
$found = $false
$attempt = 1
$maxAttempts = 10

while (($attempt -le $maxAttempts) -and (-not $found)) {

    if (Test-Path $logFile -PathType Leaf) {
        $found = Select-String -Path $logFile -Pattern $successMessage -SimpleMatch -Quiet
    }

    if ($found) {
        Write-Output "Success message found."
    }
    else {
        Write-Output "Success message not found. Checking again..."
        Start-Sleep -Seconds 5
    }

    $attempt++
}
