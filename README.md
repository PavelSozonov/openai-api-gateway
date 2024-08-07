# OpenAI API Gateway

This project sets up an NGINX gateway for OpenAI API with rate limiting and CORS support using Docker and Docker Compose.

## Directory Structure

```
openai-api-gateway/
│
├── docker-compose.yaml
├── docker-compose-azure.yaml
├── image/
│   ├── Dockerfile
│   ├── gateway-nginx.conf
│   └── init.sh
└── README.md
```

## Files

- `docker-compose.yaml`: Docker Compose configuration file to define and run the OpenAI API gateway service.
- `docker-compose-azure.yaml`: Docker Compose configuration file to define and run the Azure OpenAI API gateway service.
- `image/Dockerfile`: Dockerfile to build the NGINX gateway image.
- `image/gateway-nginx.conf`: NGINX configuration file for setting up the gateway.
- `image/init.sh`: Initialization script to replace environment variables and start NGINX.
- `README.md`: Project documentation.

## Setup

1. Ensure you have Docker and Docker Compose installed.
2. Clone the repository.
3. Navigate to the project directory.
4. Build and run the containers using Docker Compose:
   ```sh
   docker-compose up --build
   ```

## Environment Variables

- `GATEWAY_API_KEY`: The API key for the gateway (Required).
- `OPENAI_API_KEY`: The API key for OpenAI (Required).
- `OPENAI_API_HOST`: The host for the OpenAI API (Optional, default is `https://api.openai.com`).
- `RATE_LIMIT`: The rate limit for requests (Optional, default is `20r/m`).
- `CLIENT_MAX_BODY_SIZE`: The maximum body size for client requests (Optional, default is `25m`).
- `CORS_ORIGIN`: CORS allowed origins (Optional, default is `*`).
- `CORS_METHODS`: CORS allowed methods (Optional, default is `*`).
- `CORS_HEADERS`: CORS allowed headers (Optional, default is `*`).
- `CORS_CREDENTIALS`: CORS allow credentials (Optional, default is `true`).
- `CORS_MAX_AGE`: CORS max age (Optional, default is `86400`).
- `CONTENT_LENGTH`: Content length for pre-flight requests (Optional, default is `0`).
- `CONTENT_TYPE`: Content type for pre-flight requests (Optional, default is `text/plain charset=UTF-8`).

## Usage

After starting the containers, the API gateways will be available on the specified ports. Adjust the environment variables in the `docker-compose.yaml` and `docker-compose-azure.yaml` files as needed.

## License

This project is licensed under the GNU General Public License v3.0.
