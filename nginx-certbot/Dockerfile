# This creates a docker image that runs nginx and certbot to handle SSL and serve web content
# Start from the latest nginx alpine image
FROM nginx:alpine

# Install Certbot and its Nginx plugin
RUN apk add --no-cache certbot certbot-nginx bash

# Copy custom Nginx configuration. Use this if you want to use a custom nginx.conf file
# COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY ./conf.d /etc/nginx/conf.d

# Create a directory for Certbot to store certificates
RUN mkdir -p /etc/letsencrypt /var/www/certbot

# Create a script to renew the certificates and reload Nginx
COPY ./scripts/ /scripts/
RUN chmod +x /scripts/reload-nginx.sh /scripts/certbot-renew.sh

# Expose ports 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Start Nginx and run Certbot renew in a cron-like fashion
CMD ["sh", "-c", "nginx -g 'daemon off;' & /scripts/certbot-renew.sh"]
