# #############################################################################
# Example 6 — Retry an API operation at least once
# Real-life scenario: Make an initial API request and retry if it fails.
# #############################################################################

$attempt = 0
$maxAttempts = 3
$success = $false

do {
    $attempt++
    Write-Output "API attempt $attempt of $maxAttempts"

    try {
        # Replace this with the real API call.
        $success = $true
    }
    catch {
        $success = $false
        Write-Output "API call failed."
    }

    if (-not $success -and $attempt -lt $maxAttempts) {
        Start-Sleep -Seconds 3
    }
}
while (-not $success -and $attempt -lt $maxAttempts)

if ($success) {
    Write-Output "API call succeeded."
}
else {
    Write-Output "API call failed after $maxAttempts attempts."
}
