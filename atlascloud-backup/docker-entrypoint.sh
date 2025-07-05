#!/bin/sh
set -e

if [ -z "$CONFLUENCE" ] && [ -z "$JIRA" ]; then
    echo "Please configure CONFLUENCE or JIRA env variables"
    exit 1
fi

if [ -z "$EMAIL" ] || [ -z "$TOKEN" ]; then
    echo "Please configure EMAIL and TOKEN env variables"
    exit 1
fi

echo "sites:" > /app/config.yml

if [[ -n "$CONFLUENCE" ]]; then
    cat << EOT >> /app/config.yml
  confluence:
    ${CONFLUENCE}:
      email: ${EMAIL}
      token: ${TOKEN}
      includeAttachments: ${CONFLUENCE_INCLUDE_ATTACHMENTS:-false}
EOT
fi

if [ -n "$JIRA" ]; then
    cat << EOT >> /app/config.yml
  jira:
    ${JIRA}:
      email: ${EMAIL}
      token: ${TOKEN}
      includeAttachments: ${JIRA_INCLUDE_ATTACHMENTS:-false}
EOT
fi

cat << EOT >> /app/config.yml
backups:
  path: ./backups
  retainCount: ${RETAIN_COUNT:-7}
  maxAgeHours: ${MAX_AGE_HOURS:-192}
  maxSizeShrinkPercent: ${MAX_SIZE_SHRINK_PERCENT:-10}
  maxWaitMinutes: ${MAX_WAIT_MINUTES:-120}
  sleepSeconds: ${SLEEP_SECONDS:-10}
EOT

echo "0 ${RUN_AT_MINUTE:-0} ${RUN_AT_HOUR:-0} ${RUN_AT_DAY:-*} * * * node /app create" > /app/crontab

exec "$@"
