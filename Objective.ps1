Connect-AzAccount
Select-AzSubscription #subscriptionID
$RG = "testresourcegroup"
$loc = "eastus"

New-AzResourceGroup -Name $RG -location $loc

$appServicePlanName = "myAppServicePlan"
New-AzAppServicePlan -ResourceGroupName  $RG -Name $appServicePlanName -location $loc -Tier "Free"

$webAppName = "myWebApp" + [DateTime]::Now.Ticks.ToString()
New-AzWebApp -ResourceGroupName  $RG -Name $webAppName -location $loc -AppServicePlan $appServicePlanName

$sqlServerName = "my-sql-server-" + [DateTime]::Now.Ticks.ToString()
$databaseName = "myDatabase"
$adminLogin = "myAdminLogin"
$adminPassword = "Comas5738q029#ord"

New-AzSqlServer -ResourceGroupName  $RG -ServerName $sqlServerName -location $loc -SqlAdministratorCredentials (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminLogin, (ConvertTo-SecureString -String $adminPassword -AsPlainText -Force))
New-AzSqlDatabase -ResourceGroupName  $RG -ServerName $sqlServerName -DatabaseName $databaseName -Edition "Basic"
