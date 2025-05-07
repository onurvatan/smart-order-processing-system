// modules/keyVault.bicep

@description('Location for Key Vault')
param location string
@description('Prefix for Key Vault name')
param prefix string
@description('Object ID of the administrator')
param adminObjectId string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${prefix}kv'
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: adminObjectId
        permissions: {
          secrets: ['get', 'list', 'set', 'delete']
        }
      }
    ]
    enableSoftDelete: true
    enablePurgeProtection: true
  }
}
