# #############################################################################
# Example 15 — Process a queue until it is empty
# Real-life scenario: Process jobs one by one until no jobs remain.
# #############################################################################

$queue = [System.Collections.Queue]::new()

$queue.Enqueue("Job-001")
$queue.Enqueue("Job-002")
$queue.Enqueue("Job-003")

do {
    $job = $queue.Dequeue()

    Write-Output "Processing $job"
}
while ($queue.Count -gt 0)
