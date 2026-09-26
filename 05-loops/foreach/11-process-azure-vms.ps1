# #############################################################################
# Example 11 — Process Azure virtual machines
# Real-life scenario: Inventory multiple Azure VMs during operations work.
# #############################################################################

# Requires Az PowerShell and an authenticated Azure session.
$vms = Get-AzVM

foreach ($vm in $vms) {
    Write-Output "VM: $($vm.Name)"
    Write-Output "Resource Group: $($vm.ResourceGroupName)"
    Write-Output "Location: $($vm.Location)"
    Write-Output ""
}
