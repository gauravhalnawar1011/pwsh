# #############################################################################
# Example 18 — Wait for a Docker container to become running
# Real-life scenario: Wait for a containerized application before running tests.
# #############################################################################

# Requires Docker CLI.
$containerName = "my-app"
$attempt = 1
$maxAttempts = 10
$running = $false

while (($attempt -le $maxAttempts) -and (-not $running)) {

    $status = docker inspect -f "{{.State.Status}}" $containerName 2>$null

    if ($status -eq "running") {
        $running = $true
    }
    else {
        Write-Output "Container status: $status"
        Start-Sleep -Seconds 3
    }

    $attempt++
}

if ($running) {
    Write-Output "Container is running."
}
else {
    Write-Output "Container did not start."
}
