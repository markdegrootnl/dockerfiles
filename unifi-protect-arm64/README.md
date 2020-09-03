# UniFi Protect ARM64

Run UniFi Protect in Docker on ARM64 hardware.

## Usage

Run the container as a daemon:

```bash
docker run -d --name unifi-protect-arm64  \
    --privileged \
    --tmpfs /run \
    --tmpfs /run/lock \
    --tmpfs /tmp \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -p 80:80 \
    -p 443:443 \
    -v protect-persistent:/persistent \
    -v protect-srv:/srv \
    -v protect-data:/data \
    markdegroot/unifi-protect-arm64:latest
```

Now you can access UniFi Protect at `https://localhost/`.

## Build your own container
To build your own container put the deb files for `ulp-go`, `unifi-core` and `unifi-protect` in the `put-deb-files-here` folder and run:
```bash
docker build -t markdegroot/unifi-protect-arm64 .
```

## Disclaimer

This Docker image is not associated with UniFi in any way. We do not distribute any third party software and only use packages that are freely available on the internet.
