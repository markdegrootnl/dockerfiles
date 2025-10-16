#!/bin/sh
set -e

echo "${CRONTAB_SCHEDULE} /usr/local/bin/backup.sh" > /etc/crontab

exec "$@"
