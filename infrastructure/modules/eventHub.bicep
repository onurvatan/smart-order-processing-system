param location string
param namePrefix string

resource namespace 'Microsoft.EventHub/namespaces@2022-10-01-preview' = {
  name: '${namePrefix}-ehns'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    isAutoInflateEnabled: true
    maximumThroughputUnits: 2
  }
}
