// modules/acr.bicep

@description('Location for ACR')
param location string
@description('Prefix for ACR name')
@minLength(5)
param prefix string

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: '${prefix}acr'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
