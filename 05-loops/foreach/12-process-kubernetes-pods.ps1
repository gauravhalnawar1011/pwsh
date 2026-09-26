# #############################################################################
# Example 12 — Process Kubernetes pod information
# Real-life scenario: Inspect pod status and identify pods that are not running.
# #############################################################################

# Requires kubectl and an active Kubernetes context.
$pods = kubectl get pods --no-headers

foreach ($pod in $pods) {
    Write-Output "Pod: $pod"
}
