FROM easysoft/debian:11 as fetchbin

RUN wget https://get.helm.sh/chartmuseum-v0.15.0-linux-amd64.tar.gz && tar xf chartmuseum-v0.15.0-linux-amd64.tar.gz -C /opt

FROM easysoft/debian:11

LABEL maintainer "ysicing i@ysicing.me"

ENV OS_ARCH="amd64" \
    OS_NAME="debian-11" \
    HOME_PAGE="https://github.com/helm/chartmuseum"

COPY debian/prebuildfs /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

RUN install_packages curl wget zip unzip s6 pwgen cron

COPY --from=fetchbin /opt/linux-amd64/chartmuseum /usr/local/bin/chartmuseum

# Install render-template
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "render-template" "1.0.1-10" --checksum 5e410e55497aa79a6a0c5408b69ad4247d31098bdb0853449f96197180ed65a4

# Install chartmuseum
ARG VERSION
ENV APP_VER=${VERSION}
ENV EASYSOFT_APP_NAME="chartmuseum $APP_VER"

# Copy chartmuseum config files
COPY debian/rootfs /

# Copy chartmuseum source code
WORKDIR /apps/chartmuseum

EXPOSE 8080

# Persistence directory
VOLUME [ "/data"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
