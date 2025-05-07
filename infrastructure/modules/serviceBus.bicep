param location string
param namePrefix string

resource sbNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: '${namePrefix}-sbns'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}
