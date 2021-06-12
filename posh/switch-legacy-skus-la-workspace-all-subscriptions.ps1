$workspaces = Search-AzGraph -Query "where type =~ 'Microsoft.OperationalInsights/workspaces'"
ForEach($workspace in $workspaces){
    Set-AzOperationalInsightsWorkspace -ResourceGroupName $workspace.ResourceGroupName -Name $workspace.Name -Sku pergb2018
}


