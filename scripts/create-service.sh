#!/bin/bash

#Global Variables
serviceExtension=".service"
servicePath="/etc/systemd/system/"

# Ask the user for the service name
echo Enter Service Name:
read serviceName

echo "Creating $serviceName$serviceExtension..."
cp assets/sample-service.service $servicePath$serviceName$serviceExtension
fullPath=$servicePath$serviceName$serviceExtension
echo "Created Successfully"

#Reading Service Description
echo Enter Service Description:
read serviceDescription
sed -i -e "s~{{ServiceDescription}}~$serviceDescription~g" $fullPath

#Reading Working Directory
echo Enter Working Directory "(ex: /var/aspnetcore/hellomvc)"
read workingDirectory
sed -i -e "s~{{WorkingDirectory}}~$workingDirectory~g" $fullPath

#Reading DLL Name
echo Enter DLL Name "(ex: hellomvc.dll)"
read dllName
sed -i -e "s~{{WorkingDirectoryPlusDLL}}~$workingDirectory/$dllName~g" $fullPath

#Reading System Log Id
echo Enter System Log Identifier "(ex: dotnet-example)"
read systemLogId
sed -i -e "s~{{SystemLogId}}~$systemLogId~g" $fullPath

echo "Service created successfully."