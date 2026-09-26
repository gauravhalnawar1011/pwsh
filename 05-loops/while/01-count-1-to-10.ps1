# #############################################################################
# Example 1 — Count from 1 to 10
# Real-life scenario: Repeat an operation while a counter remains within a limit.
# #############################################################################

$i = 1

while ($i -le 10) {
    Write-Output $i
    $i++
}
