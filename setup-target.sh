#!/bin/bash
echo 'Installing necesary packages...'
sudo apt update
sudo apt install -y docker.io docker-compose-v2 nginx git curl

echo 'Enabling docker...'

sudo systemctl enable docker
sudo systemctl start docker

echo 'Creating systemd-unit...'
sudo cp /opt/mywebapp/systemd/mywebapp-docker.service /etc/systemd/system/mywebapp.service
sudo systemctl daemon-reload
sudo systemctl enable mywebapp.service

echo "Starting app..."
sudo systemctl start mywebapp.service

echo "Verifying deployment..."
sleep 10
curl -f http://localhost/health


echo "Deployment successgfull!!!"