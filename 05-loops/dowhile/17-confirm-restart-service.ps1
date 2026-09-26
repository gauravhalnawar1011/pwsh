# #############################################################################
# Example 17 — Confirm a service restart
# Real-life scenario: Ask for confirmation before restarting a production service.
# #############################################################################

do {
    $answer = Read-Host "Restart the service? (yes/no)"

    if ($answer -eq "yes") {
        Restart-Service -Name "wuauserv"
        Write-Output "Service restarted."
    }
    elseif ($answer -eq "no") {
        Write-Output "Restart cancelled."
    }
    else {
        Write-Output "Please enter yes or no."
    }
}
while ($answer -notin @("yes", "no"))
