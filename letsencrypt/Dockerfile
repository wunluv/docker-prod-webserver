# Start from the official Certbot image
FROM certbot/certbot:latest

# Install the Nginx plugin for Certbot
RUN pip3 install certbot-nginx

# Install Docker CLI to enable cross-container communication
RUN apk add --no-cache docker-cli

RUN mkdir -p /scripts && echo "#!/bin/sh\ndocker exec nginx nginx -s reload" > /scripts/reload-nginx.sh && chmod +x /scripts/reload-nginx.sh
