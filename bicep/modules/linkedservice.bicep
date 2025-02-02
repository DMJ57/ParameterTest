targetScope = 'resourceGroup'  // Set targetScope to resourceGroup

param dataFactoryName string
param linkedServices array
// param connectionString string
param encryptedCredential string

//param environment string

//param resourceGroupName string = parameters('${environment}').resourceGroupName
//param location string = parameters('${environment}').location
//param adfName string = parameters('${environment}').adfName

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: 'East US'
}


resource linkedService 'Microsoft.DataFactory/factories/linkedservices@2018-06-01' = [for linkedService in linkedServices: {
  parent: dataFactory
  name: linkedService.name  // Removed the ${dataFactory.name}/ part
  properties: {
    type: linkedService.definition.properties.type
    typeProperties: linkedService.definition.properties.typeProperties
  }
}]
