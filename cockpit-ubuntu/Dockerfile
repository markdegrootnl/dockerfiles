FROM jrei/systemd-ubuntu

RUN apt-get update \
    && apt-get install -y cockpit-system cockpit-ws cockpit-bridge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "root:cockpit" | chpasswd

RUN mkdir -p /root/.local/share/cockpit

RUN printf "[WebService]\nAllowUnencrypted=true\n" > /etc/cockpit/cockpit.conf

EXPOSE 9090
