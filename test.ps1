Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/mslearn-arm-deploymentscripts-sample/appsettings.json' -OutFile 'appsettings.json'
$storageAccount = Get-AzStorageAccount -ResourceGroupName 'learndeploymentscript_exercise_1' | Where-Object { $_.StorageAccountName -like 'storage*' }
$blob = Set-AzStorageBlobContent -File 'appsettings.json' -Container 'config' -Blob 'appsettings.json' -Context $StorageAccount.Context
$DeploymentScriptOutputs = @{}
$DeploymentScriptOutputs['Uri'] = $blob.ICloudBlob.Uri
$DeploymentScriptOutputs['StorageUri'] = $blob.ICloudBlob.StorageUri
