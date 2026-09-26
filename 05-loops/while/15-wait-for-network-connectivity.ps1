# #############################################################################
# Example 15 — Wait for network connectivity
# Real-life scenario: Wait for network access before starting a deployment step.
# #############################################################################

$target = "8.8.8.8"
$attempt = 1
$maxAttempts = 5
$connected = $false

while (($attempt -le $maxAttempts) -and (-not $connected)) {

    Write-Output "Testing connectivity - attempt $attempt"

    $connected = Test-Connection -ComputerName $target -Count 1 -Quiet -ErrorAction SilentlyContinue

    if (-not $connected) {
        Start-Sleep -Seconds 3
    }

    $attempt++
}

if ($connected) {
    Write-Output "Network connectivity is available."
}
else {
    Write-Output "Network connectivity could not be established."
}
