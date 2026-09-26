# #############################################################################
# Example 18 — Execute deployment steps in sequence
# Real-life scenario: Represent a simple fixed deployment workflow.
# #############################################################################

$steps = @(
    "Validate configuration",
    "Build application",
    "Run tests",
    "Build Docker image",
    "Push image",
    "Deploy application"
)

for ($i = 0; $i -lt $steps.Count; $i++) {
    Write-Output "Step $($i + 1): $($steps[$i])"
}
