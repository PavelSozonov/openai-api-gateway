#!/bin/sh

# Substitute environment variables
envsubst '${GATEWAY_API_KEY},${OPENAI_API_KEY},${OPENAI_API_HOST},${DOMAIN},${RATE_LIMIT},${CLIENT_MAX_BODY_SIZE},${CORS_ORIGIN},${CORS_METHODS},${CORS_HEADERS},${CORS_CREDENTIALS},${CORS_MAX_AGE},${CONTENT_LENGTH},${CONTENT_TYPE}' < /etc/nginx/templates/gateway-nginx.conf.template > /etc/nginx/conf.d/default.conf

# Start nginx in the background
nginx &

# Wait for Nginx to be ready
sleep 5

# Request a certificate from Let's Encrypt
certbot --nginx -d ${DOMAIN} --non-interactive --agree-tos --email ${EMAIL}

# Reload nginx to apply the certificate
nginx -s reload

# Keep the container running
exec "nginx" "-g" "daemon off;"
