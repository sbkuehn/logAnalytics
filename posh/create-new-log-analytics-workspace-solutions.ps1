[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$location,
    [Parameter(Mandatory=$true)]
    [string]$workspaceName,
    [Parameter(Mandatory=$true)]
    [string]$resourceGroupName
)

# Connect to Azure
Connect-AzAccount

# Create Resource Group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Location $location -Name $resourceGroupName
}

# Create Log Analytics Workspace
$workspace = New-AzOperationalInsightsWorkspace -Location $location `
                                                -Name $workspaceName `
                                                -Sku PerGB2018 `
                                                -ResourceGroupName $resourceGroupName

# List of solutions to add to the Log Analytics Workspace
$solutions = @(
    'ADAssessment','AzureActivity','AzureNetworking','AgentHealthAssessment',
    'InfrastructureInsights','KeyVaultAnalytics','NetworkMonitoring','AntiMalware',
    'AlertManagement','Security','ContainerInsights','Containers','DHCPActivity',
    'DnsAnalytics','ServiceMap','SiteRecovery','SecurityCenterFree','SecurityInsights',
    'VMInsights','AgentHealthAssessment'
)

# Add solutions to the Log Analytics Workspace
foreach ($solution in $solutions) {
    Set-AzOperationalInsightsIntelligencePack -ResourceGroupName $resourceGroupName `
                                              -WorkspaceName $workspaceName `
                                              -IntelligencePackName $solution `
                                              -Enabled $true
}

Write-Host "Log Analytics workspace and solutions have been created successfully."
