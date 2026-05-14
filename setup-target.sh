#!/bin/bash
echo 'Installing necesary packages...'
sudo apt update
sudo apt install -y docker.io docker-compose-v2 nginx git curl

echo 'Enabling docker...'

sudo systemctl enable docker
sudo systemctl start docker

echo 'Enabling nginx default...'

sudo unlink /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx


echo 'Creating systemd-unit...'
sudo cp /opt/mywebapp/systemd/mywebapp-docker.service /etc/systemd/system/mywebapp.service
sudo systemctl daemon-reload
sudo systemctl enable mywebapp.service

sudo chown ubuntu:ubuntu /opt/mywebapp
sudo usermod -aG docker ubuntu
newgrp docker

echo "Starting app..."
sudo systemctl start mywebapp.service

echo "Deployment successfull!!! Check the status with (sudo systemctl start mywebapp.service), when the image is ready try to (curl -f http://localhost/health/alive)"
