FROM node:24-alpine3.22

WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN apk add --no-cache supercronic tzdata \
    && wget -qO- https://bitbucket.org/addcraftio/atlascloud-backup/get/master.tar.gz | tar -xvz --strip-components 1 \
    && npm install -ci --no-dev

CMD ["/usr/bin/supercronic", "-debug", "/app/crontab"]
