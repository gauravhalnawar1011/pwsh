# #############################################################################
# Example 12 — Wait for a Kubernetes pod to become Ready
# Real-life scenario: Wait for a deployment to become ready in a CI/CD pipeline.
# #############################################################################

# Requires kubectl and an active Kubernetes context.
$podName = "my-app-pod"
$maxAttempts = 10
$attempt = 1
$ready = $false

while (($attempt -le $maxAttempts) -and (-not $ready)) {

    Write-Output "Checking pod $podName - attempt $attempt"

    $status = kubectl get pod $podName -o jsonpath='{.status.phase}' 2>$null

    if ($status -eq "Running") {
        $ready = $true
    }
    else {
        Write-Output "Pod status: $status"
        Start-Sleep -Seconds 5
    }

    $attempt++
}

if ($ready) {
    Write-Output "Pod is running."
}
else {
    Write-Output "Pod did not become running."
}
