FROM alpine:latest

ARG VERSION="2.32.0"

ENV CRONTAB_SCHEDULE="00 0 * * *"

COPY docker-entrypoint.sh backup.sh /usr/local/bin/

RUN apk add --no-cache supercronic tzdata jq

RUN wget "https://cache.agilebits.com/dist/1P/op2/pkg/v${VERSION}/op_linux_$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/)_v${VERSION}.zip" -O op.zip \
    && unzip -d op op.zip \
    && mv op/op /usr/local/bin/ \
    && rm -r op.zip op

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD ["/usr/bin/supercronic", "-debug", "/etc/crontab"]
