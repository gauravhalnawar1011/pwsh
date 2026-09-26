# #############################################################################
# Example 6 — Wait for a TCP port to become available
# Real-life scenario: Wait for an application to start listening before testing it.
# #############################################################################

$computer = "localhost"
$port = 8080
$maxAttempts = 10
$attempt = 1
$available = $false

while (($attempt -le $maxAttempts) -and (-not $available)) {

    Write-Output "Checking $computer`:$port - attempt $attempt"

    $available = Test-NetConnection `
        -ComputerName $computer `
        -Port $port `
        -InformationLevel Quiet

    if (-not $available) {
        Start-Sleep -Seconds 3
    }

    $attempt++
}

if ($available) {
    Write-Output "Port $port is available."
}
else {
    Write-Output "Port $port did not become available."
}
