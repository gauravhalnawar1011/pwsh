# #############################################################################
# Example 17 — Create a server inventory report
# Real-life scenario: Build structured data that can later be exported to CSV.
# #############################################################################

$servers = "web01", "web02", "db01"

$report = foreach ($server in $servers) {
    [PSCustomObject]@{
        Server = $server
        CheckedAt = Get-Date
        Status = "Checked"
    }
}

$report | Format-Table
