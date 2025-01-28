targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array
// param connectionString string
param encryptedCredential string

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}

resource linkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  parent: dataFactory
  name: linkedService.name  // Removed the ${dataFactory.name}/ part
  properties: {
    type: linkedService.definition.properties.type
    typeProperties: {
      connectionString: linkedService.definition.properties.typeProperties.connectionString
      encryptedCredential: encryptedCredential}
  }
}]
