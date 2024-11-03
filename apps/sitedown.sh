#!/bin/bash
# Stop Astro & Ghost container
docker-compose -f docker-compose-astro.yml -f docker-compose-ghost.yml down
sleep 10
# Remove nginx config
rm /var/www/private/nginx/conf.d/ghost.mojah2.mojahmedia.conf
rm /var/www/private/nginx/conf.d/one.mojah2.mojahmedia.conf
# Reload nginx
docker exec -it nginx nginx -s reload