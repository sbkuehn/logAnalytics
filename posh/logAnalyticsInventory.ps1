$workspaces = Search-AzGraph -Query "where type =~ 'Microsoft.OperationalInsights/workspaces'"
ForEach ($workspace in $workspaces) { 
    [PSCustomObject]@{
        Name          = $workspace.name 
        Location      = $workspace.location 
        ResourceGroup = $workspace.resourceGroup
        Sku           = $workspace.properties.sku
        Features      = $workspace.properties.features
    }
}
Export-Csv C:\la-inventory.csv -NoTypeInformation