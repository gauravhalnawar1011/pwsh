# #############################################################################
# Example 11 — Check network connectivity until successful
# Real-life scenario: Verify network availability before continuing a deployment.
# #############################################################################

$target = "8.8.8.8"
$attempt = 0
$maxAttempts = 5
$connected = $false

do {
    $attempt++

    Write-Output "Network check $attempt of $maxAttempts"

    $connected = Test-Connection `
        -ComputerName $target `
        -Count 1 `
        -Quiet `
        -ErrorAction SilentlyContinue

    if (-not $connected -and $attempt -lt $maxAttempts) {
        Start-Sleep -Seconds 3
    }
}
while (-not $connected -and $attempt -lt $maxAttempts)

if ($connected) {
    Write-Output "Network connectivity is available."
}
else {
    Write-Output "Network connectivity failed."
}
