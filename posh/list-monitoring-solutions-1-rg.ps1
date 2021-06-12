[CmdletBinding()]
    param(
    [Parameter(Mandatory=$true)]
    [string]$resourceGroup
    )

    Get-AzMonitorLogAnalyticsSolution -ResourceGroupName $resourceGroup | Select Name, Location, Id | Export-Csv c:\la-solution-1-rg.csv -NoTypeInformation






