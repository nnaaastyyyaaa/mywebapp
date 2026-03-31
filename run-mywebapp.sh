#!/bin/bash
echo 'Installing necesary packages...'
sudo apt update
sudo apt install nodejs npm postgresql git nginx curl build-essential

sudo -u postgres createdb task-tracker
sudo -u postgres createuser postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'password123';"

echo 'Creating system users...'
useradd -m -s /bin/bash student
usermod -aG sudo student

useradd -m -s /bin/bash teacher
echo "teacher:12345678" | chpasswd
usermod -aG sudo teacher

useradd -m -s /bin/bash -g users operator
echo "operator:12345678" | chpasswd

useradd -r -m -d /home/app -s /usr/sbin/nologin app

mkdir -p /home/app
chown -R app:app /home/app
chmod 700 /home/app

mkdir -p /home/student
echo "N=1" > /home/student/gradebook
chown -R student:student /home/student

chage -d 0 teacher
chage -d 0 operator

echo "operator ALL=(ALL) NOPASSWD: \
/bin/systemctl start mywebapp, \
/bin/systemctl stop mywebapp, \
/bin/systemctl restart mywebapp, \
/bin/systemctl status mywebapp, \
/bin/systemctl reload nginx" | sudo tee /etc/sudoers.d/operator

chown -R app:app /opt/mywebapp
chmod -R 750 /opt/mywebapp

sudo  mkdir -p /etc/mywebapp
sudo  cp /opt/mywebapp/.env.example /etc/mywebapp/.env
chown -R app:app /etc/mywebapp
chmod -R 750 /etc/mywebapp

echo 'Installing dependencies...'
sudo -u app npm install --prefix /opt/mywebapp

echo 'Creating systemd-unit...'
chmod +x /opt/mywebapp/migrate.sh
sudo cp /opt/mywebapp/systemd/mywebapp.service /etc/systemd/system/mywebapp.service
sudo cp /opt/mywebapp/systemd/mywebapp.socket /etc/systemd/system/mywebapp.socket

sudo systemctl daemon-reload
sudo systemctl enable mywebapp.socket
sudo systemctl start mywebapp.socket

echo 'Setting up nginx proxy...'

sudo cp /opt/mywebapp/nginx/mywebapp.conf /etc/nginx/sites-available/mywebapp

sudo ln -s /etc/nginx/sites-available/mywebapp /etc/nginx/sites-enabled/mywebapp
sudo unlink /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx

echo 'Blocking the default user...'

sudo passwd -l ubuntu

echo "Deployment completed!!!"