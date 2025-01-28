# ParameterTest


{
  "clientId": "0ef2096b-b7db-4828-96df-311fa2eef4e5",
  "clientSecret": "Izr8Q~H9WeVuNDzFy7.64Ft~n6h.UR9GOHYD.bds",
  "subscriptionId": "bf9a4ebd-cedd-4c38-9e06-f2552a7e4f3c",
  "tenantId": "351ea326-1a66-4da2-addd-15d37c541283"
}



resource jsonTemplate 'Microsoft.Resources/deployments@2021-04-01' = {
  name: 'exampleDeployment'
  properties: {
    mode: 'Incremental'
    template: json('path/to/your-template.json')
    parameters: {
      exampleParam: exampleParam
      anotherParam: anotherParam
    }
  }
}
