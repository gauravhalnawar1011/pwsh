# #############################################################################
# Example 5 — Wait for a Windows service to start
# Real-life scenario: Wait for a required service before continuing deployment.
# #############################################################################

$serviceName = "wuauserv"

$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

while ($null -ne $service -and $service.Status -ne "Running") {
    Write-Output "$serviceName is $($service.Status). Waiting..."
    Start-Sleep -Seconds 5

    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
}

if ($null -eq $service) {
    Write-Output "Service not found."
}
else {
    Write-Output "$serviceName is running."
}
