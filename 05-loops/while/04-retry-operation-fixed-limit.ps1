# #############################################################################
# Example 4 — Retry an operation with a maximum attempt limit
# Real-life scenario: Retry a temporary operation without creating an infinite loop.
# #############################################################################

$attempt = 1
$maxAttempts = 5
$success = $false

while (($attempt -le $maxAttempts) -and (-not $success)) {

    Write-Output "Attempt $attempt of $maxAttempts"

    # Replace this with the real operation.
    $success = $false

    if (-not $success) {
        Write-Output "Operation failed."
        $attempt++
    }
}

if ($success) {
    Write-Output "Operation succeeded."
}
else {
    Write-Output "Operation failed after $maxAttempts attempts."
}
