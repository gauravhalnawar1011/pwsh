# #############################################################################
# Example 5 — Ask for confirmation before deletion
# Real-life scenario: Require confirmation before performing a destructive operation.
# #############################################################################

do {
    $confirmation = Read-Host "Do you want to continue? (yes/no)"

    if ($confirmation -notin @("yes", "no")) {
        Write-Output "Please enter yes or no."
    }
}
while ($confirmation -notin @("yes", "no"))

if ($confirmation -eq "yes") {
    Write-Output "Delete operation approved."
}
else {
    Write-Output "Delete operation cancelled."
}
