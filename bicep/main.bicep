// main.bicep

targetScope = 'resourceGroup'

param dataFactoryName string
param dataflows array
param datasets array
param linkedservices array
param pipelines array
param triggers array

param location string = 'East US' // Default location

module dataFactoryModule './modules/datafactory.bicep' = {
  name: 'ADFcomponents'
  params: {
    dataFactoryName: dataFactoryName
    location: location
  }
}

module dataflowsModule './modules/dataflow.bicep' = {
  name: 'dataflows'
  params: {
    dataflows: dataflows
    dataFactoryName: dataFactoryModule.name // Pass the reference
  }
}

module dataSetModule './modules/dataset.bicep' = {
  name: 'datasets'
  params: {
    datasets: datasets
    dataFactoryName: dataFactoryModule.name // Pass the reference
  }
}

module linkedserviceModules './modules/dataset.bicep' = {
  name: 'linkedservices'
  params: {
    datasets: linkedservices
    dataFactoryName: dataFactoryModule.name // Pass the reference
  }
}

module pipelineModules './modules/dataset.bicep' = {
  name: 'pipelines'
  params: {
    datasets: pipelines
    dataFactoryName: dataFactoryModule.name // Pass the reference
  }
}

module triggerModules './modules/dataset.bicep' = {
  name: 'triggers'
  params: {
    datasets: triggers
    dataFactoryName: dataFactoryModule.name // Pass the reference
  }
}
