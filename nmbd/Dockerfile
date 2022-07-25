FROM alpine:3.15.5

RUN apk add --no-cache samba-server

COPY start.sh /start.sh

EXPOSE 137/udp

CMD ["/start.sh"]
