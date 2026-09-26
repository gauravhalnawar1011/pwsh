# #############################################################################
# Example 20 — Retry deployment and stop when successful
# Real-life scenario: Try a deployment a fixed number of times and stop after success.
# #############################################################################

$maxAttempts = 5

for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {

    Write-Output "Deployment attempt $attempt of $maxAttempts"

    # Replace this with the actual deployment command.
    $deploymentSuccessful = $false

    if ($deploymentSuccessful) {
        Write-Output "Deployment successful."
        break
    }

    Write-Output "Deployment failed."

    if ($attempt -eq $maxAttempts) {
        Write-Output "Maximum attempts reached. Deployment failed."
        exit 1
    }

    Start-Sleep -Seconds 5
}
