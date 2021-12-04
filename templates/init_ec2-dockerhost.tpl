#!/bin/bash

# update system
sudo yum update -y

# install docker engine
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# install essentials
sudo yum install -y git curl tree

# clone git repo of our app
cd /
git clone https://github.com/thomas2110781014/ssoapt-nginx-certbot-golang-postgres-php.git
cd ssoapt-nginx-certbot-golang-postgres-php

export AWS=yes

# get let's encrypt certificate
sudo -E ./init-letsencrypt.sh

# start services
sudo docker-compose up -d
