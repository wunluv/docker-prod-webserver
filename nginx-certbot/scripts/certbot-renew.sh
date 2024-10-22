#!/bin/bash
# This script renews certbot certificates and reloads Nginx periodically
while :; do
    certbot renew --nginx
    sleep 12h
done
