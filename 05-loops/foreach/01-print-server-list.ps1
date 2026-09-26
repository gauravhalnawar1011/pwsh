# #############################################################################
# Example 1 — Print a list of servers
# Real-life scenario: Display all servers that need to be processed.
# #############################################################################

$servers = "web01", "web02", "web03", "db01"

foreach ($server in $servers) {
    Write-Output "Server: $server"
}
