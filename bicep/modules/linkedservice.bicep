targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array
param AzureBlobStorageConnectionString string
param AzureBlobStorageEncryptedCredential string 
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
  template: json('linkedService/AzureBlobStorage1.json')
    parameters: {
      exampleParam: AzureBlobStorageConnectionString
      anotherParam: AzureBlobStorageEncryptedCredential
    }
}
}]
