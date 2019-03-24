#!/usr/bin/env bash

wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y apt-transport-https
sudo apt-get update -y
sudo apt-get install -y dotnet-sdk-2.2

sudo mkdir /opt/dotnet-service
sudo cd /opt/dotnet-service
sudo dotnet new mvc
sudo dotnet build
sudo dotnet publish -c Release -r linux-x64 -o /opt/dotnet-service/

sudo cp -f ~/dotnet-service.service /etc/systemd/system/
sudo systemctl daemon-reload  
sudo systemctl enable dotnet-service.service  
sudo systemctl start dotnet-service.service  
sudo systemctl status dotnet-service.service  
