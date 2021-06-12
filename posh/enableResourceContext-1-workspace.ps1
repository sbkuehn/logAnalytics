[CmdletBinding()]
    param(
    [Parameter(Mandatory=$true)]
    [string]$workspaceName
    )

    $workspace = Get-AzResource -Name $workspaceName -ExpandProperties
    if($workspace.Properties.features.enableLogAccessUsingOnlyResourcePermissions -eq $null)
    {
        $workspace.Properties.features | Add-Member enableLogAccessUsingOnlyResourcePermissions $true -Force
    }
    else
    {
        $workspace.Properties.features.enableLogAccessUsingOnlyResourcePermissions = $true
    }