# #############################################################################
# Example 10 — Start or wait for an application process
# Real-life scenario: Verify that an application process starts successfully.
# #############################################################################

$processName = "notepad"

Start-Process "notepad.exe"

$attempt = 0
$maxAttempts = 5
$running = $false

do {
    $attempt++

    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue

    if ($null -ne $process) {
        $running = $true
    }
    else {
        Write-Output "Process not found. Checking again..."
        Start-Sleep -Seconds 2
    }
}
while (-not $running -and $attempt -lt $maxAttempts)

if ($running) {
    Write-Output "$processName is running."
}
else {
    Write-Output "$processName did not start."
}
