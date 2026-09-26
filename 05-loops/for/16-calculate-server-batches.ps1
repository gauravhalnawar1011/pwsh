# #############################################################################
# Example 16 — Process servers in fixed-size batches
# Real-life scenario: Avoid processing all servers at once during maintenance.
# #############################################################################

$servers = "server01", "server02", "server03", "server04", "server05", "server06"
$batchSize = 2

for ($i = 0; $i -lt $servers.Count; $i += $batchSize) {
    $end = [math]::Min($i + $batchSize - 1, $servers.Count - 1)

    Write-Output "Processing batch:"

    for ($j = $i; $j -le $end; $j++) {
        Write-Output "  $($servers[$j])"
    }

    Write-Output ""
}
