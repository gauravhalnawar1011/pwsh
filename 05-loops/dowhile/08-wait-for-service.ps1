# #############################################################################
# Example 8 — Start a service and wait until it is running
# Real-life scenario: Start a required Windows service and verify its final state.
# #############################################################################

$serviceName = "wuauserv"

Start-Service -Name $serviceName -ErrorAction SilentlyContinue

do {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        Write-Output "Service not found."
        break
    }

    Write-Output "Current status: $($service.Status)"

    if ($service.Status -ne "Running") {
        Start-Sleep -Seconds 3
    }
}
while ($service.Status -ne "Running")

if ($null -ne $service -and $service.Status -eq "Running") {
    Write-Output "$serviceName is running."
}
