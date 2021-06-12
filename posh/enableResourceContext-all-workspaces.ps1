$workspaces = Search-AzGraph -Query "where type =~ 'Microsoft.OperationalInsights/workspaces'"
    ForEach ($workspace in $workspaces) 
    { 
        if($_.properties.features.features.enableLogAccessUsingOnlyResourcePermissions -eq $false)
    {
        $workspace.Properties.features | Add-Member enableLogAccessUsingOnlyResourcePermissions $true -Force
    }
    else
    {
        $workspace.Properties.features.enableLogAccessUsingOnlyResourcePermissions = $true 
    }
    Set-AzResource -ResourceId $workspace.ResourceId -Properties $workspace.Properties -Force
}    