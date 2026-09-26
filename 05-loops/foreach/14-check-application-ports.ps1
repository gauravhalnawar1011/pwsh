# #############################################################################
# Example 14 — Check application ports
# Real-life scenario: Verify that required application ports are reachable.
# #############################################################################

$ports = 80, 443, 8080, 8443

foreach ($port in $ports) {
    $result = Test-NetConnection -ComputerName "localhost" -Port $port -InformationLevel Quiet

    if ($result) {
        Write-Output "Port $port : OPEN"
    }
    else {
        Write-Output "Port $port : CLOSED"
    }
}
