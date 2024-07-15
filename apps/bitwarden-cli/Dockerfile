FROM debian:sid-slim AS build

ARG VERSION
ARG TARGETPLATFORM

WORKDIR /dist

RUN apt update && \
    apt install -y wget unzip && \
    wget https://github.com/bitwarden/clients/releases/download/cli-v${VERSION}/bw-linux-${VERSION}.zip && \
    unzip bw-linux-${VERSION}.zip && \
    chmod +x bw

FROM debian:sid-slim

ARG VERSION
ARG TARGETPLATFORM

COPY --from=build /dist/bw /usr/local/bin/bw
COPY ./apps/bitwarden-cli/entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
