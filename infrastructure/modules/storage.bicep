param location string
param namePrefix string

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: '${namePrefix}storage'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
