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
    markdegroot/unifi-protect-x86:latest
```

Now you can access UniFi Protect at `https://localhost:7443/`.

It's highly recommended that you set a [memory limit on this container](https://docs.docker.com/config/containers/resource_constraints/#limit-a-containers-access-to-memory), otherwise it will use all of your RAM over time, I'm not sure if this issue is fixed on newer ARM versions.

## Build your own container
To build your own container run:
```bash
docker build -t markdegroot/unifi-protect-x86 .
```
**Important:** The deb-files required to build this image are no longer hosted by UniFi. You have to find your own version of this file and alter the Dockerfile setup.

## Disclaimer

This Docker image is not associated with UniFi in any way. We do not distribute any third party software and only use packages that are freely available on the internet.
