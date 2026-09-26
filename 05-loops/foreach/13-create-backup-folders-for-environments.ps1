# #############################################################################
# Example 13 — Create backup folders for environments
# Real-life scenario: Prepare backup directories for Dev, QA, and Production.
# #############################################################################

$environments = "Dev", "QA", "Production"
$backupRoot = "C:\Backups"

foreach ($environment in $environments) {
    $path = Join-Path $backupRoot $environment

    New-Item -Path $path -ItemType Directory -Force | Out-Null

    Write-Output "Backup directory ready: $path"
}
