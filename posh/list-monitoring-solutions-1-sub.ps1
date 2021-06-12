[CmdletBinding()]
    param(
    [Parameter(Mandatory=$true)]
    [string]$subscriptionId
    )

    Get-AzMonitorLogAnalyticsSolution -SubscriptionId $subscriptionId | Select Name, Location, Id | Export-Csv c:\la-solution-1subId.csv -NoTypeInformation



