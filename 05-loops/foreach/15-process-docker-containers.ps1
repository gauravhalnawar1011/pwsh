# #############################################################################
# Example 15 — Process Docker containers
# Real-life scenario: Inspect running containers during troubleshooting.
# #############################################################################

# Requires Docker CLI.
$containers = docker ps --format "{{.Names}}"

foreach ($container in $containers) {
    Write-Output "Container: $container"
}
