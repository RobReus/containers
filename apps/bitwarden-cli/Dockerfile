FROM debian:sid-slim

ARG VERSION
ARG TARGETPLATFORM

RUN apt update && \
    apt install -y wget unzip && \
    wget https://github.com/bitwarden/clients/releases/download/cli-v${VERSION}/bw-linux-${VERSION}.zip && \
    unzip bw-linux-${VERSION}.zip && \
    chmod +x bw && \
    mv bw /usr/local/bin/bw && \
    rm -fv bw-linux-${VERSION}.zip

COPY ./apps/bitwarden-cli/entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
