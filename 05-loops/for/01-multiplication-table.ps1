# #############################################################################
# Example 1 — Print multiplication table of 5
# Real-life scenario: Generate a quick calculation/reference table.
# #############################################################################

$number = 5

for ($i = 1; $i -le 10; $i++) {
    Write-Output "$number x $i = $($number * $i)"
}
