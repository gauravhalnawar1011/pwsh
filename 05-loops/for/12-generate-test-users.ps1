# #############################################################################
# Example 12 — Generate test usernames
# Real-life scenario: Create predictable test data for an application or lab.
# #############################################################################

for ($i = 1; $i -le 10; $i++) {
    $username = "testuser$i"
    Write-Output "Generated username: $username"
}
