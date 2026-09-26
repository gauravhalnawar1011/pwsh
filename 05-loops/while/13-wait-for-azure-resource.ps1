# #############################################################################
# Example 13 — Wait for an Azure resource to reach a state
# Real-life scenario: Poll a cloud resource during provisioning.
# #############################################################################

# Requires Az PowerShell and an authenticated Azure session.
$resourceGroup = "my-resource-group"
$resourceName = "my-vm"
$attempt = 1
$maxAttempts = 10
$ready = $false

while (($attempt -le $maxAttempts) -and (-not $ready)) {

    Write-Output "Checking Azure VM - attempt $attempt"

    $vm = Get-AzVM -ResourceGroupName $resourceGroup -Name $resourceName -Status -ErrorAction SilentlyContinue

    if ($vm) {
        $powerState = ($vm.Statuses | Where-Object Code -like "PowerState/*").DisplayStatus

        if ($powerState -eq "VM running") {
            $ready = $true
        }
        else {
            Write-Output "Current state: $powerState"
        }
    }
    else {
        Write-Output "VM not found yet."
    }

    if (-not $ready) {
        Start-Sleep -Seconds 10
    }

    $attempt++
}

if ($ready) {
    Write-Output "Azure VM is running."
}
else {
    Write-Output "Azure VM did not reach the required state."
}
