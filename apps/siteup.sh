#!/bin/bash
# Start the Ghost Container
docker-compose -f docker-compose-ghost.yml up -d --remove-orphans
sleep 10
docker-compose -f docker-compose-astro.yml up -d --remove-orphans
sleep 10
cp ../nginx/ghost.mojah2.mojahmedia.conf /var/www/private/nginx/conf.d
cp ../nginx/one.mojah2.mojahmedia.conf /var/www/private/nginx/conf.d
docker exec -it nginx nginx -s reload



