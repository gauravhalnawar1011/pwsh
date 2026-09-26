# #############################################################################
# Example 9 — Generate test IP addresses
# Real-life scenario: Generate predictable test data for networking exercises.
# #############################################################################

for ($i = 1; $i -le 10; $i++) {
    $ip = "192.168.1.$i"
    Write-Output $ip
}
