FROM debian

ENV CRIU_VERSION=3.4

CMD ["nsenter", "-t", "1", "-m", "-u", "-n", "-i", "sh", "-c", \
     "if [ \"$(criu --version)\" != \"Version: $CRIU_VERSION\" ]; then \
        apk update && \
        apk add \
            tar \
            ip6tables \
            build-base \
            coreutils \
            git \
            protobuf-c-dev \
            protobuf-dev \
            python \
            libaio-dev \
            libcap-dev \
            libnl3-dev \
            pkgconfig \
            libnet-dev \
            ccache \
            gcc && \
        (rm \"criu-$CRIU_VERSION.tar.bz2\" || true) && \
        (rm -rf \"criu-$CRIU_VERSION\" || true) && \
        wget \"http://download.openvz.org/criu/criu-$CRIU_VERSION.tar.bz2\" && \
        tar -xjf \"./criu-$CRIU_VERSION.tar.bz2\" && \
        cd \"criu-$CRIU_VERSION\" && \
        make && cd criu && cp criu /usr/sbin/criu; \
      fi \
    "]
