FROM eclipse-temurin:17-jre-alpine

RUN apk update && apk add curl

ARG MINECRAFT_VERSION=1.19.2
ARG PAPER_MINOR_VERSION=271
ARG PAPER_URL="https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/271/downloads/paper-${MINECRAFT_VERSION}-${PAPER_MINOR_VERSION}.jar"
WORKDIR /minecraft
RUN curl "${PAPER_URL}" > paper.jar

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /minecraft/worlds

ENTRYPOINT ["/entrypoint.sh"]
