# Cockpit on Ubuntu

You can use this image to run [Cockpit](https://cockpit-project.org/) and to develop Cockpit packages.

## Usage

Run the container as a daemon:

```bash
docker run -d --name cockpit-ubuntu \
    --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -p 9090:9090 markdegroot/cockpit-ubuntu
```

Now you can access Cockpit at `http://localhost:9090`. Login with username `root` and password `cockpit`.

### Developing packages
To develop, place your compiled package in `/root/.local/share/cockpit` or mount your dist path to this folder using:

```bash
docker run -d --name cockpit-ubuntu \
    --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /path-to/my-cockpit-package/output:/root/.local/share/cockpit \
    -p 9090:9090 markdegroot/cockpit-ubuntu
```
Note: make sure your packages is built into a subfolder of the mounted folder (`/path-to/my-cockpit-package/output` in this example).

You can also use this `docker-compose.yaml` file:
```yaml
version: '2'
services:
  cockpit-ubuntu:
    image: markdegroot/cockpit-ubuntu
    volumes:
      - /path-to/my-cockpit-package/output:/root/.local/share/cockpit
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    ports:
      - "9090:9090"
    privileged: true

```
