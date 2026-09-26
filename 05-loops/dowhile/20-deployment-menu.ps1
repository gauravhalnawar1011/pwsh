# #############################################################################
# Example 20 — Simple deployment menu
# Real-life scenario: Build a small interactive DevOps administration tool.
# #############################################################################

do {
    Write-Output ""
    Write-Output "================================"
    Write-Output "       Deployment Menu"
    Write-Output "================================"
    Write-Output "1. Deploy"
    Write-Output "2. Check status"
    Write-Output "3. Rollback"
    Write-Output "4. Exit"

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" {
            Write-Output "Starting deployment..."
        }

        "2" {
            Write-Output "Checking deployment status..."
        }

        "3" {
            Write-Output "Starting rollback..."
        }

        "4" {
            Write-Output "Exiting..."
        }

        default {
            Write-Output "Invalid choice."
        }
    }
}
while ($choice -ne "4")
