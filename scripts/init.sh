!#/bin/bash

sudo apt update

sudo apt install nodejs -y
sudo npm install -g npm@latest
sudo npm install -g yarn
sudo npm install -g pm2

# Install Nginx
sudo apt install nginx -y
sudo systemctl enable nginx
# sudo cat ./nginx/backend-node.conf > /etc/nginx/sites-available/default
# sudo systemctl restart nginx