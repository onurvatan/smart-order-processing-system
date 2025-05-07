#!/bin/bash

# -----------------------
# Deploy Smart Order Infra (Dev)
# -----------------------

RESOURCE_GROUP="smartorder-dev-rg"
LOCATION="westeurope"
BICEP_FILE="infra/main.bicep"
PARAMS_FILE="infra/parameters/main.dev.json"

echo "✅ Creating resource group (if not exists)..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "🚀 Deploying Bicep template to resource group..."
az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file $BICEP_FILE \
  --parameters @$PARAMS_FILE

echo "🎉 Deployment complete."
