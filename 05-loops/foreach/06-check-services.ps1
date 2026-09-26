# #############################################################################
# Example 6 — Check multiple Windows services
# Real-life scenario: Verify that required services are running on a server.
# #############################################################################

$services = "wuauserv", "bits", "spooler"

foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        Write-Output "$serviceName : NOT FOUND"
    }
    elseif ($service.Status -eq "Running") {
        Write-Output "$serviceName : RUNNING"
    }
    else {
        Write-Output "$serviceName : $($service.Status)"
    }
}
