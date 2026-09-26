# #############################################################################
# Example 16 — Validate deployment environment
# Real-life scenario: Keep asking for a valid environment before starting deployment.
# #############################################################################

$validEnvironments = "Dev", "QA", "Production"

do {
    $environment = Read-Host "Enter environment (Dev/QA/Production)"

    if ($environment -notin $validEnvironments) {
        Write-Output "Invalid environment."
    }
}
while ($environment -notin $validEnvironments)

Write-Output "Selected environment: $environment"
