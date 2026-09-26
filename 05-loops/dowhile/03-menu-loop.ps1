# #############################################################################
# Example 3 — Display an administration menu
# Real-life scenario: Keep showing a menu until the user selects Exit.
# #############################################################################

do {
    Write-Output ""
    Write-Output "1. Check server"
    Write-Output "2. Check service"
    Write-Output "3. Exit"

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" { Write-Output "Checking server..." }
        "2" { Write-Output "Checking service..." }
        "3" { Write-Output "Exiting..." }
        default { Write-Output "Invalid choice." }
    }
}
while ($choice -ne "3")
