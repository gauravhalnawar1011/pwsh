# #############################################################################
# Example 8 — Search ERROR in multiple log files
# Real-life scenario: Scan application logs for errors during troubleshooting.
# #############################################################################

$logs = Get-ChildItem "C:\Logs" -Filter "*.log" -File -ErrorAction SilentlyContinue

foreach ($log in $logs) {
    $errors = Select-String -Path $log.FullName -Pattern "ERROR" -SimpleMatch

    if ($errors) {
        Write-Output "Errors found in: $($log.FullName)"

        foreach ($errorLine in $errors) {
            Write-Output "  $($errorLine.Line)"
        }
    }
}
