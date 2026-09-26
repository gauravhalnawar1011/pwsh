# #############################################################################
# Example 4 — Create numbered directories
# Real-life scenario: Prepare multiple folders for application test environments.
# #############################################################################

$basePath = "C:\Temp\Environments"

for ($i = 1; $i -le 5; $i++) {
    $directory = Join-Path $basePath "Environment-$i"
    New-Item -Path $directory -ItemType Directory -Force | Out-Null
    Write-Output "Created: $directory"
}
