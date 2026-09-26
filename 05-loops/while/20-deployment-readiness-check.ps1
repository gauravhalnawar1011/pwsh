# #############################################################################
# Example 20 — Wait until multiple deployment checks pass
# Real-life scenario: Wait for an application to become ready before continuing a pipeline.
# #############################################################################

$attempt = 1
$maxAttempts = 10
$ready = $false

while (($attempt -le $maxAttempts) -and (-not $ready)) {

    Write-Output "Readiness check $attempt of $maxAttempts"

    # Replace these with real health checks.
    $applicationReady = $true
    $databaseReady = $true
    $networkReady = $true

    if ($applicationReady -and $databaseReady -and $networkReady) {
        $ready = $true
    }
    else {
        Write-Output "Application is not ready. Waiting..."
        Start-Sleep -Seconds 5
    }

    $attempt++
}

if ($ready) {
    Write-Output "All readiness checks passed. Continue deployment."
}
else {
    Write-Output "Readiness checks failed."
    exit 1
}
