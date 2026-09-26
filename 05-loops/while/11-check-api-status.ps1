# #############################################################################
# Example 11 — Poll an API until it becomes available
# Real-life scenario: Wait for an application health endpoint after deployment.
# #############################################################################

$url = "https://example.com"
$available = $false
$attempt = 1
$maxAttempts = 5

while (($attempt -le $maxAttempts) -and (-not $available)) {

    Write-Output "Health check attempt $attempt"

    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 10 -ErrorAction Stop

        if ($response.StatusCode -ge 200 -and $response.StatusCode -lt 400) {
            $available = $true
        }
    }
    catch {
        Write-Output "Endpoint is not ready."
    }

    if (-not $available) {
        Start-Sleep -Seconds 5
    }

    $attempt++
}

if ($available) {
    Write-Output "Application is available."
}
else {
    Write-Output "Application did not become available."
}
