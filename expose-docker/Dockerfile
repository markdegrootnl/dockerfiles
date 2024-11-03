FROM backdevs/expose:latest

ENV DNS_SERVER=

RUN sed -i 's/set -- "$@" "${SHARE}"/set -- "$@" "share" "${SHARE}"/g' /usr/local/bin/docker-entrypoint.sh
