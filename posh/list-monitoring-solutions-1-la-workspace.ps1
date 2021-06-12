[CmdletBinding()]
    param(
    [Parameter(Mandatory=$true)]
    [string]$resourceGroup,
    [Parameter(Mandatory=$true)]
    [string]$workspaceName
    )

Get-AzMonitorLogAnalyticsSolution -ResourceGroupName $resourceGroup -WorkspaceName $workspaceName