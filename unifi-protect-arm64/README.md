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
    -p 7080:7080 \
    -p 7443:7443 \
    -p 7444:7444 \
    -p 7877:7877 \
    -p 7442:7442 \
    -p 7446:7446 \
    -p 7550:7550 \
    -p 7447:7447 \
    -p 9812:9812 \
    -p 9444:9444 \
    -p 9080:9080 \
    -v protect-persistent:/persistent \
    -v protect-srv:/srv \
    -v protect-data:/data \
    markdegroot/unifi-protect-arm64:latest
```

Now you can access UniFi Protect at `https://localhost/`.

## Storage
UniFi Protect needs a lot of storage to record video. Protect will fail to start if there is not at least 100GB disk space available, so make sure to store your Docker volumes on a disk with some space.

## Build your own container
To build your own container put the deb files for `ulp-go`, `unifi-core` and `unifi-protect` in the `put-deb-files-here` folder and run:
```bash
docker build -t markdegroot/unifi-protect-arm64 .
```

## Disclaimer

This Docker image is not associated with UniFi in any way. We do not distribute any third party software and only use packages that are freely available on the internet.
