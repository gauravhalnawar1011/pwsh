# #############################################################################
# Example 5 — Process the first 10 items in an array
# Real-life scenario: Process a fixed number of records from a collection.
# #############################################################################

$servers = "server01", "server02", "server03", "server04", "server05",
           "server06", "server07", "server08", "server09", "server10"

for ($i = 0; $i -lt $servers.Count; $i++) {
    Write-Output "Processing server: $($servers[$i])"
}
