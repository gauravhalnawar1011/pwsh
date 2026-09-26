# #############################################################################
# Example 14 — Check a service a fixed number of times
# Real-life scenario: Monitor a service during startup or maintenance.
# #############################################################################

$serviceName = "wuauserv"
$checks = 5

for ($i = 1; $i -le $checks; $i++) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($service) {
        Write-Output "Check $i`: $serviceName status = $($service.Status)"
    }
    else {
        Write-Output "Check $i`: Service not found."
    }

    Start-Sleep -Seconds 2
}
