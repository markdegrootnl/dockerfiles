FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        postgresql \
        mount \
        psmisc \
        dpkg \
        apt \
        lsb-release \
        sudo \
        gnupg \
        apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

COPY ./ubnt-tools_1.0.deb /ubnt-tools_1.0.deb
RUN dpkg -i /ubnt-tools_1.0.deb \
    && rm -f /ubnt-tools_1.0.deb

RUN wget https://fw-download.ubnt.com/data/unifi-protect/4707-Debian9_5famd64-1.13.3-85b0dd59653f41cc97b3599213a483c0.deb \
    && dpkg -i 4707-Debian9_5famd64-1.13.3-85b0dd59653f41cc97b3599213a483c0.deb \
    && rm 4707-Debian9_5famd64-1.13.3-85b0dd59653f41cc97b3599213a483c0.deb

VOLUME ["/srv/unifi-protect", "/var/lib/postgresql/10/main"]

EXPOSE 7080/tcp 7443/tcp 7444/tcp 7447/tcp 7550/tcp 7442/tcp

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./protect.sh /protect.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/protect.sh"]
