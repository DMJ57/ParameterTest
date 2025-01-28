targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array
param Secret1 string = "kx-demo-constring-dev"
param Secret2 string = "kx-demo-creds-dev"
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
      "Secret1": Secret1
      "Secret2": Secret2
    }
}
}]
