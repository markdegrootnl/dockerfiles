FROM alpine:latest

RUN apk add --no-cache apache2-utils

CMD ["/bin/sh", "-e", "-u", "-c", "/usr/bin/htpasswd -bBn ${USERNAME} ${PASSWORD}"]
