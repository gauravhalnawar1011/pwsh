# #############################################################################
# Example 1 — Print numbers from 1 to 5
# Real-life scenario: Execute an operation at least once and continue while a condition is true.
# #############################################################################

$i = 1

do {
    Write-Output $i
    $i++
}
while ($i -le 5)
