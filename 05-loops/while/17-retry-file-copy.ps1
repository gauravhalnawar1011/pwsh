# #############################################################################
# Example 17 — Retry copying a file
# Real-life scenario: Retry a temporary file-transfer failure before reporting failure.
# #############################################################################

$source = "C:\Deploy\app.zip"
$destination = "C:\Backup\app.zip"
$attempt = 1
$maxAttempts = 3
$copied = $false

while (($attempt -le $maxAttempts) -and (-not $copied)) {

    Write-Output "Copy attempt $attempt"

    try {
        Copy-Item -Path $source -Destination $destination -Force -ErrorAction Stop
        $copied = $true
    }
    catch {
        Write-Output "Copy failed: $($_.Exception.Message)"
        Start-Sleep -Seconds 3
    }

    $attempt++
}

if ($copied) {
    Write-Output "File copied successfully."
}
else {
    Write-Output "File copy failed after $maxAttempts attempts."
}
