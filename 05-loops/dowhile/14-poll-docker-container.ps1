# #############################################################################
# Example 14 — Wait for a Docker container to run
# Real-life scenario: Verify that a container starts before running application tests.
# #############################################################################

# Requires Docker CLI.
$containerName = "my-app"
$attempt = 0
$maxAttempts = 10
$running = $false

do {
    $attempt++

    $status = docker inspect -f "{{.State.Status}}" $containerName 2>$null

    Write-Output "Container status: $status"

    if ($status -eq "running") {
        $running = $true
    }
    elseif ($attempt -lt $maxAttempts) {
        Start-Sleep -Seconds 3
    }
}
while (-not $running -and $attempt -lt $maxAttempts)

if ($running) {
    Write-Output "Container is running."
}
else {
    Write-Output "Container did not start."
}
