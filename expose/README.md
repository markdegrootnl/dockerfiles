# Expose

## Server:

### Build:
```bash
docker build --progress plain --platform linux/amd64 --secret id=composer_auth,src=$HOME/.composer/auth.json -t markdegroot/expose-server .
```

### Use:
```yaml
services:
  expose:
    image: markdegroot/expose-server:latest
    environment:
      domain: ${DOMAIN}
      username: ${ADMIN_USERNAME}
      password: ${ADMIN_PASSWORD}
    restart: unless-stopped
    volumes:
      - expose:/root/.expose
    ports:
      - 8080:8080

volumes:
  expose:
```

## Client:

### Build:
```bash
git clone https://github.com/backdevs/expose-docker.git /tmp/expose-docker \
&& docker build --build-arg VERSION=3.0.2 --progress plain --platform linux/amd64 -f /tmp/expose-docker/Dockerfile -t markdegroot/expose-client /tmp/expose-docker \
&& rm -rf /tmp/expose-docker
```

### Use:
```yaml
services:
  expose:
    image: markdegroot/expose-client:latest
    environment:
      SERVER_HOST: my.expose.server
      AUTH_TOKEN: ${EXPOSE_TOKEN}
      SHARE: http://mysite
      SUBDOMAIN: ${SUBDOMAIN}
      DNS_SERVER:
    restart: unless-stopped
    ports:
      - 4040:4040
```
