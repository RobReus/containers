FROM docker.io/library/alpine:3.20 AS build

ARG VERSION
ARG TARGETPLATFORM

WORKDIR /dist

RUN apk --no-cache add curl unzip && \
    curl -LO https://github.com/bitwarden/clients/releases/download/cli-v${VERSION}/bw-linux-${VERSION}.zip && \
    unzip bw-linux-${VERSION}.zip && \
    chmod +x bw

FROM docker.io/library/alpine:3.20

COPY --from=build /dist/bw /usr/local/bin/bw

COPY ./apps/bitwarden-cli/entrypoint.sh /

CMD ["/entrypoint.sh"]
