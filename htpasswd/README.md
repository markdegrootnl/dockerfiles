# htpasswd

Docker image to create `.htpasswd` file.

## Usage

Run the container:

```bash
docker run -it --rm \
    -e USERNAME=... \
    -e PASSWORD=... \
    markdegroot/htpassword
```

or using a `.env` file:
```bash
docker run -it --rm \
    --env-file .env \
    markdegroot/htpassword
```
