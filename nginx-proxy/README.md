# NGINX Proxy

Docker-compose file to run an Automated Nginx Reverse Proxy using [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) and [docker-letsencrypt-nginx-proxy-companion](https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion).

## Usage

Run the containers as a daemon:

```bash
docker-compose up -d
```

Any containers you want to proxy need to be connected to the `proxy` network and should have the `VIRTUAL_HOST` and `LETSENCRYPT_HOST` ENV variables set to the domain to use.

## Configuration
All variables inside the `.env` file will be passed to both containers. See the container's documentation for supported variables.

## More information
- https://github.com/nginx-proxy/nginx-proxy
- https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion
