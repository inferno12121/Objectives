Connect-AzAccount # connect to subscription 
Select-AzSubscription SubscriptionID # enter the ID
$resourceGroups = Get-AzResourceGroup # get all RGs
foreach ($resourceGroup in $resourceGroups) {
    $resourceGroupName = $resourceGroup.ResourceGroupName
    $vms = Get-AzVm -ResourceGroupName $resourceGroupName
    foreach ($vm in $vms) {
        $vmName = $vm.Name
        $metadata = $vm.OSProfile.Metadata
        Write-Host "Metadata for VM: $vmName in Resource Group: $resourceGroupName"
        $metadata
    }
}
