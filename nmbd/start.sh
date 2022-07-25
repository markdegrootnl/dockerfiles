#!/bin/sh
set -e

/usr/sbin/nmbd -i \
    "--option=netbios name = ${NETBIOS_NAME:-$HOSTNAME}" \
    "--option=workgroup = ${NETBIOS_WORKGROUP:-WORKGROUP}" \
    "--option=local master = no"
