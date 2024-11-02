#!/bin/bash
# Start the Ghost Container
docker-compose -f docker-compose-ghost.yml up -d
cp ../nginx/one.mojah2.mojahmedia.conf /var/www/private/nginx/conf.d
docker exec -it nginx nginx -s reload

if docker inspect -f '{{.State.Running}}' ghost_oneplusone | grep -q "true"; then
  echo "Container is already up..."
else
  echo "Container is not up yet, waiting 10 seconds..."
  sleep 10
  if docker inspect -f '{{.State.Running}}' ghost_oneplusone | grep -q "true"; then
    echo "Container is now up, executing command..."
    docker-compose -f docker-compose-astro.yml up -d
    cp ../nginx/one.mojah2.mojahmedia.conf /var/www/private/nginx/conf.d
    docker exec -it nginx nginx -s reload
  else
    echo "Container is still not up, exiting..."
    exit 1
  fi
fi



