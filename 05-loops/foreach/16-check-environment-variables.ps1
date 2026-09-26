# #############################################################################
# Example 16 — Check required environment variables
# Real-life scenario: Validate configuration before starting a deployment.
# #############################################################################

$requiredVariables = "APP_NAME", "APP_ENVIRONMENT", "API_URL"

foreach ($variableName in $requiredVariables) {
    $value = [Environment]::GetEnvironmentVariable($variableName)

    if ([string]::IsNullOrWhiteSpace($value)) {
        Write-Output "$variableName : MISSING"
    }
    else {
        Write-Output "$variableName : PRESENT"
    }
}
