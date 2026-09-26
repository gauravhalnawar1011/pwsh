# #############################################################################
# Example 15 — Generate test data records
# Real-life scenario: Generate predictable records for application testing.
# #############################################################################

for ($i = 1; $i -le 10; $i++) {
    $record = [PSCustomObject]@{
        Id     = $i
        Name   = "User$i"
        Status = "Active"
    }

    $record
}
