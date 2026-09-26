# #############################################################################
# Example 10 — Process Azure resource groups
# Real-life scenario: Perform the same inventory/reporting operation for each resource group.
# #############################################################################

# Requires Azure PowerShell and an authenticated Azure session.
$resourceGroups = Get-AzResourceGroup

foreach ($resourceGroup in $resourceGroups) {
    Write-Output "Resource Group: $($resourceGroup.ResourceGroupName)"
    Write-Output "Location: $($resourceGroup.Location)"
}
