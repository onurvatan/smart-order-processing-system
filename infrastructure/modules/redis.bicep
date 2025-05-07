param location string
param namePrefix string

resource redis 'Microsoft.Cache/Redis@2023-01-01' = {
  name: '${namePrefix}-redis'
  location: location
  sku: {
    name: 'Basic'
    family: 'C'
    capacity: 1
  }
  properties: {
    enableNonSslPort: false
  }
}
