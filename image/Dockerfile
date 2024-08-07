FROM nginx:latest

# Default environment variable values
ENV OPENAI_API_HOST="https://api.openai.com"
ENV RATE_LIMIT="20r/m"
ENV CLIENT_MAX_BODY_SIZE="25m"
ENV CORS_ORIGIN="*"
ENV CORS_METHODS="*"
ENV CORS_HEADERS="*"
ENV CORS_CREDENTIALS="true"
ENV CORS_MAX_AGE="86400"
ENV CONTENT_LENGTH="0"
ENV CONTENT_TYPE="text/plain charset=UTF-8"

# Install Certbot and its Nginx plugin
RUN apt-get update && apt-get install -y certbot python3-certbot-nginx

# Copy gateway configuration template
COPY gateway-nginx.conf.template /etc/nginx/templates/gateway-nginx.conf.template

# Copy and run init script to inject environment variables into configuration and run nginx
COPY init.sh /docker-entrypoint.d/init.sh
RUN chmod +x /docker-entrypoint.d/init.sh
