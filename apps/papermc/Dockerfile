FROM alpine:latest

ARG VERSION
ARG TARGETPLATFORM

ENV EULA="false" \
    MC_RAM="" \
    JAVA_FLAGS="" \
    PAPERMC_FLAGS=""

RUN apk update \
    && apk add libstdc++ \
    && apk add openjdk21-jre \
    && apk add wget \
    && apk add bash \
    && mkdir /papermc \
    && wget https://api.papermc.io/v2/projects/paper/versions/${VERSION%-*}/builds/${VERSION#*-}/downloads/paper-${VERSION}.jar -O /papermc/papermc.jar

COPY ./apps/papermc/entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
