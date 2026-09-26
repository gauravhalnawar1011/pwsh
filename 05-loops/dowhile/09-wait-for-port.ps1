# #############################################################################
# Example 9 — Wait for an application port
# Real-life scenario: Start an application and wait until its TCP port is reachable.
# #############################################################################

$computer = "localhost"
$port = 8080
$attempt = 0
$maxAttempts = 10
$available = $false

do {
    $attempt++

    Write-Output "Checking port $port - attempt $attempt"

    $available = Test-NetConnection `
        -ComputerName $computer `
        -Port $port `
        -InformationLevel Quiet

    if (-not $available -and $attempt -lt $maxAttempts) {
        Start-Sleep -Seconds 3
    }
}
while (-not $available -and $attempt -lt $maxAttempts)

if ($available) {
    Write-Output "Port $port is available."
}
else {
    Write-Output "Port $port is not available."
}
