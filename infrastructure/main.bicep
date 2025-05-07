// main.bicep

@description('Location for all resources')
param location string = resourceGroup().location

@description('Prefix for all resources')
param prefix string = 'sop'

@description('Admin object ID for access policies')
param adminObjectId string

module acr 'modules/acr.bicep' = {
  name: 'acrModule'
  params: {
    prefix: prefix
    location: location
  }
}

module appService 'modules/appService.bicep' = {
  name: 'appServiceModule'
  params: {
    namePrefix: prefix
    location: location
  }
}

module storage 'modules/storage.bicep' = {
  name: 'storageModule'
  params: {
    namePrefix: prefix
    location: location
  }
}

module cosmosDb 'modules/cosmos.bicep' = {
  name: 'cosmosModule'
  params: {
    prefix: prefix
    location: location
  }
}

module serviceBus 'modules/serviceBus.bicep' = {
  name: 'serviceBusModule'
  params: {
    namePrefix: prefix
    location: location
  }
}

module eventHub 'modules/eventHub.bicep' = {
  name: 'eventHubModule'
  params: {
    namePrefix: prefix
    location: location
  }
}

module eventGrid 'modules/eventGrid.bicep' = {
  name: 'eventGridModule'
}

module keyVault 'modules/keyVault.bicep' = {
  name: 'keyVaultModule'
  params: {
    prefix: prefix
    location: location
    adminObjectId: adminObjectId
  }
}

module redis 'modules/redis.bicep' = {
  name: 'redisModule'
  params: {
    namePrefix: prefix
    location: location
  }
}
