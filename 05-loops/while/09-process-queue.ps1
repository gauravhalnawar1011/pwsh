# #############################################################################
# Example 9 — Process items from a queue
# Real-life scenario: Continue processing work while items remain in a queue.
# #############################################################################

$queue = [System.Collections.Queue]::new()

$queue.Enqueue("Job-001")
$queue.Enqueue("Job-002")
$queue.Enqueue("Job-003")

while ($queue.Count -gt 0) {
    $job = $queue.Dequeue()

    Write-Output "Processing $job"
}
