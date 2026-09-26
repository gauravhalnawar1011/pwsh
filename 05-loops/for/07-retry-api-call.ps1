# #############################################################################
# Example 7 — Retry an operation a fixed number of times
# Real-life scenario: Retry a temporary API/network operation before failing.
# #############################################################################

$maxAttempts = 3

for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
    Write-Output "Attempt $attempt of $maxAttempts"

    # Replace this with the real operation.
    $success = $false

    if ($success) {
        Write-Output "Operation succeeded."
        break
    }

    Write-Output "Operation failed."
}
