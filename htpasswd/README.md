# htpasswd

Docker image to create a `.htpasswd` file.

## Usage

Run the container:

```bash
docker run -it --rm \
    -e USERNAME=... \
    -e PASSWORD=... \
    markdegroot/htpasswd
```

or using a `.env` file:
```bash
docker run -it --rm \
    --env-file .env \
    markdegroot/htpasswd
```
