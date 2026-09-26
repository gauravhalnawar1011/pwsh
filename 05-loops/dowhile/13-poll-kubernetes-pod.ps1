# #############################################################################
# Example 13 — Poll a Kubernetes pod until it is running
# Real-life scenario: Wait for a pod to start after a deployment.
# #############################################################################

# Requires kubectl and an active Kubernetes context.
$podName = "my-app-pod"
$attempt = 0
$maxAttempts = 10
$running = $false

do {
    $attempt++

    $status = kubectl get pod $podName -o jsonpath='{.status.phase}' 2>$null

    Write-Output "Pod status: $status"

    if ($status -eq "Running") {
        $running = $true
    }
    elseif ($attempt -lt $maxAttempts) {
        Start-Sleep -Seconds 5
    }
}
while (-not $running -and $attempt -lt $maxAttempts)

if ($running) {
    Write-Output "Pod is running."
}
else {
    Write-Output "Pod did not become running."
}
