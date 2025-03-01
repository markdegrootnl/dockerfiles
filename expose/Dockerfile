FROM php:8.2.8-cli-alpine

ARG VERSION=3.0.0
ENV VERSION=${VERSION}

COPY --chmod=0755 --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /src

RUN --mount=type=secret,id=composer_auth,dst=/root/.composer/auth.json \
    apk add --no-cache --virtual .runtime-deps  \
      tini \
    && curl -L https://api.github.com/repos/exposedev/server/tarball/${VERSION} | tar -xz --strip-component 1 \
    && composer install -o --prefer-dist

ENV port=8080
ENV domain=localhost
ENV username=username
ENV password=password
ENV exposeConfigPath=/src/config/expose-server.php

COPY --chmod=0755 docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
