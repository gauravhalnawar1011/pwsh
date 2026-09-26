# #############################################################################
# Example 6 — Check servers using an index
# Real-life scenario: Process a known list of servers using their array position.
# #############################################################################

$servers = "web01", "web02", "web03", "web04"

for ($i = 0; $i -lt $servers.Count; $i++) {
    $server = $servers[$i]

    Write-Output "Checking $server..."
    Test-Connection -ComputerName $server -Count 1 -Quiet
}
