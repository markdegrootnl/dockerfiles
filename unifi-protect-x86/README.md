# UniFi Protect x86

Run UniFi Protect in Docker on x86 hardware.

## Usage

Run the container as a daemon:

```bash
docker run -d --name unifi-protect-x86  \
    --tmpfs /srv/unifi-protect/temp \
    -p 7080:7080 \
    -p 7443:7443 \
    -p 7444:7444 \
    -p 7447:7447 \
    -p 7550:7550 \
    -p 7442:7442 \
    -v unifi-protect-db:/var/lib/postgresql/10/main \
    -v unifi-protect:/srv/unifi-protect \
    markdegroot/unifi-protect:latest
```

Now you can access UniFi Protect at `https://localhost:7443/`.

## Disclaimer

This Docker image is not associated with UniFi in any way. We do not distribute any third party software and only use packages that are freely available on the internet.
