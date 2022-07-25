# nmbd

Run Samba's NMBD inside docker to respond to NETBIOS queries

## Usage

Run the container:

```bash
docker run -it --rm -p 137:137/udp \
    -e NETBIOS_NAME=MYHOSTNAME \
    -e NETBIOS_WORKGROUP=MYWORKGROUP \
    markdegroot/nmbd
```
The following optional parameters can be configured using environment variables:
- NETBIOS_NAME
- NETBIOS_WORKGROUP

## Building

Build the container using:
```bash
docker build -t markdegroot/nmbd .
```
