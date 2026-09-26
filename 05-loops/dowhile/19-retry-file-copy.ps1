# #############################################################################
# Example 19 — Retry a file copy operation
# Real-life scenario: Retry a temporary file-transfer failure.
# #############################################################################

$source = "C:\Deploy\app.zip"
$destination = "C:\Backup\app.zip"
$attempt = 0
$maxAttempts = 3
$copied = $false

do {
    $attempt++

    try {
        Copy-Item -Path $source -Destination $destination -Force -ErrorAction Stop
        $copied = $true
        Write-Output "File copied successfully."
    }
    catch {
        Write-Output "Copy attempt $attempt failed: $($_.Exception.Message)"

        if ($attempt -lt $maxAttempts) {
            Start-Sleep -Seconds 3
        }
    }
}
while (-not $copied -and $attempt -lt $maxAttempts)

if (-not $copied) {
    Write-Output "File copy failed after $maxAttempts attempts."
    exit 1
}
