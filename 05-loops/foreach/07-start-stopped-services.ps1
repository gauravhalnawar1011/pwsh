# #############################################################################
# Example 7 — Start stopped services
# Real-life scenario: Automatically start required services before an application deployment.
# #############################################################################

$services = "wuauserv", "bits", "spooler"

foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        Write-Output "$serviceName : Service not found."
        continue
    }

    if ($service.Status -ne "Running") {
        Start-Service -Name $serviceName
        Write-Output "$serviceName : Started"
    }
    else {
        Write-Output "$serviceName : Already running"
    }
}
