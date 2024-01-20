# You create an Azure Resource Manager (ARM) template named deploy.json as shown in the following exhibit.

deploy.json
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.jsonfi",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "obj1": {
      "type": "object",
      "defaultValue": {
        "propA": "one",
        "propB": "two",
        "propC": "three",
        "propD": {
          "propD-1": "sub",
          "propD-2": "sub"
        }
      }
    },
    "par1": {
      "type": "string",
      "allowedValues": ["centralus", "eastus", "westus"],
      "defaultValue": "eastus"
    }
  },
  "variables": {
    "var1": "westus",
    "centralus": "eastus"
  },
  "resources": [
    {
      "type": "Microsoft.Resources/resourceGroups",
      "apiVersion": "2018-05-01",
      "location": "eastus",
      "name": "[concat('IRGS', copyIndex())]",
      "copy": {
        "name": "copy",
        "count": 2
      }
    },
    {
      "type": "Microsoft.Resources/resourceGroups",
      "apiVersion": "2018-05-01",
      "location": "[last(variables('var1'))]",
      "name": "[concat('IResGrp', 18)]"
    },
    {
      "type": "Microsoft.Resources/resourceGroups",
      "apiVersion": "2018-05-01",
      "location": "[parameters('par1')]",
      "name": "[concat('IRGroup', length(parameters('obj1')))]"
    }
  ],
  "outputs": {}
}
```

You connect to the subscription and run the following command.

```powershell
New-AzDeployment –Location westus –TemplateFile “deploy.json”
```

For each of the following statements, select Yes if the statement is true. Otherwise, select No.

NOTE: Each correct selection is worth one point.

**1) Three resource groups are created when you run the script.**
   - Yes
   - No

   Answer: No  
     - It's No because it creates 4 Resource Groups and not 3 Resource Groups (RGS0, RGS1, RGroup4, and ResGrp8). 
     - **1.1:** The Resource Group named with "[concat('RGS', copyIndex())]", creates RGS0 and RGS1.
     - **1.2:** The Resource Group named with "[concat('ResGrp', '8')]", creates ResGrp8.  
     - **1.3:** The Resource Group named with "[concat('RGroup', length(parameters('obj1')))]", creates RGroup4 (As we can see, obj1 parameter has a length of 4 'propA', 'propB',  'propC' and 'propD').  

**2) A resource group named RGroup5 is created.**
   - Yes
   - No

   Answer: No  
     - It's No because it doesn't create a resource group named RGroup5.

**3) All the resource groups are created in the East US Azure region.**
   - Yes
   - No

   Answer: Yes  
     - It's Yes because all resource groups were created in the East US Azure Region.


**additional question**  
what is the difference between Parameters:  
```powershell
New-AzDeployment –TemplateFile 
New-AzDeployment –TemplateUri
```
Use a custom template and parameter file to create a deployment.
```powershell
New-AzDeployment -Location "West US" -TemplateFile "D:\Azure\Templates\example.json" 
```
Deploy a template stored in a  public storage.
```powershell
New-AzDeployment -Location "West US" -TemplateUri "https://example.com/example.json"
```
