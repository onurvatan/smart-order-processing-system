param location string
param namePrefix string

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${namePrefix}-asp'
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
    capacity: 1
  }
}

resource app 'Microsoft.Web/sites@2022-03-01' = {
  name: '${namePrefix}-api'
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
  }
}
