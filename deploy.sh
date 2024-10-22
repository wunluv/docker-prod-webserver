#!/bin/bash

# Run this script on a new server once all the directories have been created
# It will create the backend network, bring up the main docker-compose setup, and bring up the Node.js apps in their own docker-compose setup
# You will need to create the directories first:
# /var/www/private/docker - clone the repo into this directory
# /var/www/private/node if you want to run the Node.js apps
# ├── private
# │   ├── docker - nginx config
# │   ├── mariadb - data
# │   └── postgre - data
# └── public
#     ├── nodejsapp
#     ├── index.html default html file
#     ├── package-lock.json
#     ├── php5.app
#     ├── php7.app
#     └── php8.app
# bash:/var/www# ls private/docker/
# LICENSE  README.md  docker-compose.yml	nginx  nginx-certbot



# Create the backend network if it doesn't exist
docker network create backend || true

# Bring up the main docker-compose setup
cd /path/to/main/docker-compose
docker-compose up -d

# Bring up the Node.js apps in their own docker-compose setup
cd /var/www/private/node
docker-compose up -d
