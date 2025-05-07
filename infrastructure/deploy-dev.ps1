# -----------------------
# Deploy Smart Order Infra (Dev)
# -----------------------

$ResourceGroup = "smartorder-dev-rg"
$Location = "westeurope"
$BicepFile = "infra/main.bicep"
$ParamsFile = "infra/parameters/main.dev.json"

Write-Host "✅ Creating resource group (if not exists)..."
az group create --name $ResourceGroup --location $Location

Write-Host "🚀 Deploying Bicep template to resource group..."
az deployment group create `
  --resource-group $ResourceGroup `
  --template-file $BicepFile `
  --parameters @$ParamsFile

Write-Host "🎉 Deployment complete."
