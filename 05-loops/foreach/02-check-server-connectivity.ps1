# #############################################################################
# Example 2 — Check connectivity to multiple servers
# Real-life scenario: Check whether servers are reachable before maintenance.
# #############################################################################

$servers = "server01", "server02", "server03"

foreach ($server in $servers) {
    $reachable = Test-Connection -ComputerName $server -Count 1 -Quiet -ErrorAction SilentlyContinue

    if ($reachable) {
        Write-Output "$server : UP"
    }
    else {
        Write-Output "$server : DOWN"
    }
}
