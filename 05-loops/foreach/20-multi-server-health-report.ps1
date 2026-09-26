# #############################################################################
# Example 20 — Generate a basic multi-server health report
# Real-life scenario: Collect simple health information from multiple servers.
# #############################################################################

$servers = "server01", "server02", "server03"

$report = foreach ($server in $servers) {

    $reachable = Test-Connection -ComputerName $server -Count 1 -Quiet -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Server      = $server
        Reachable   = $reachable
        CheckedAt   = Get-Date
    }
}

$report | Format-Table -AutoSize
