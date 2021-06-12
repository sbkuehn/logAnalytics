$workspaces = Get-AzResource -ResourceType Microsoft.OperationalInsights/workspaces -ExpandProperties
ForEach($workspace in $workspaces){
    Set-AzOperationalInsightsWorkspace -ResourceGroupName $workspace.ResourceGroupName -Name $workspace.Name -Sku pergb2018
}
