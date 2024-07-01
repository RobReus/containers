ARG VERSION
ARG TARGETPLATFORM
FROM ghcr.io/actions/actions-runner:${VERSION}

ENV DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates \
        curl \
        gcc \
        git \
        jo \
        jq \
        moreutils \
        unrar \
        unzip \
        wget \
        zip \
    && rm -rf /var/lib/apt/lists/*

USER runner
