# #############################################################################
# Example 12 — Check deployment readiness
# Real-life scenario: Run readiness checks at least once before continuing a pipeline.
# #############################################################################

$attempt = 0
$maxAttempts = 5
$ready = $false

do {
    $attempt++

    Write-Output "Readiness check $attempt of $maxAttempts"

    # Replace these with real health checks.
    $applicationReady = $true
    $databaseReady = $true
    $networkReady = $true

    $ready = $applicationReady -and $databaseReady -and $networkReady

    if (-not $ready -and $attempt -lt $maxAttempts) {
        Write-Output "Application is not ready. Waiting..."
        Start-Sleep -Seconds 5
    }
}
while (-not $ready -and $attempt -lt $maxAttempts)

if ($ready) {
    Write-Output "Deployment is ready."
}
else {
    Write-Output "Deployment readiness check failed."
}
