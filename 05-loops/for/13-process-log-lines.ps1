# #############################################################################
# Example 13 — Process a fixed number of log lines
# Real-life scenario: Inspect a limited number of log entries during troubleshooting.
# #############################################################################

$logLines = @(
    "INFO Application started",
    "INFO Database connected",
    "WARNING High memory usage",
    "ERROR Database timeout",
    "INFO Application recovered"
)

for ($i = 0; $i -lt $logLines.Count; $i++) {
    Write-Output "Log $($i + 1): $($logLines[$i])"
}
