# login in Azure 
az login 

az account list

az account set --subscription "RND-MSD-WSIMON_01"

az account show --output table

$PSVersionTable.PSVersion

Get-Module -Name AzureRM -ListAvailable

New-AzDeployment -Location "West US" -TemplateUri "https://github.com/wit-a/AZ-104/blob/190005d9071a61630283ceeff41f4d0c509ba1b5/ARM/q1"