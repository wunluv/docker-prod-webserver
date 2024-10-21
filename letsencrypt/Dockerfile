# Start from the official Certbot image
FROM certbot/certbot:latest

# Install the Nginx plugin for Certbot
RUN pip3 install certbot-nginx

RUN mkdir -p /scripts && echo "#!/bin/sh\ndocker exec nginx nginx -s reload" > /scripts/reload-nginx.sh && chmod +x /scripts/reload-nginx.sh
