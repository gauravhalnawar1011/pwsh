# #############################################################################
# Example 16 — Process work until a counter reaches a limit
# Real-life scenario: Process repeated maintenance tasks with a controlled boundary.
# #############################################################################

$processed = 0
$limit = 5

while ($processed -lt $limit) {

    $processed++

    Write-Output "Processing task $processed of $limit"
}
