$subscriptions = Get-AzSubscription
$results = ForEach($subscription in $subscriptions){
    Get-AzMonitorLogAnalyticsSolution -SubscriptionId $subscription.Id | Select Name, Location, Id 
} 
$results | Export-Csv c:\list-monitoring-solutions-all-subs.csv -NoTypeInformation


