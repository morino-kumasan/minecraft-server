FROM docker.io/eclipse-temurin:17-jre-alpine

RUN apk update && apk add curl wget

ARG MINECRAFT_VERSION=1.19.2
ARG PAPER_MINOR_VERSION=271
ARG PAPER_URL="https://api.papermc.io/v2/projects/paper/versions/${MINECRAFT_VERSION}/builds/${PAPER_MINOR_VERSION}/downloads/paper-${MINECRAFT_VERSION}-${PAPER_MINOR_VERSION}.jar"
WORKDIR /minecraft
RUN curl "${PAPER_URL}" > paper.jar

ADD entrypoint.sh /minecraft
RUN chmod +x /minecraft/*.sh

VOLUME /minecraft/worlds
EXPOSE 25565

ENTRYPOINT ["/minecraft/entrypoint.sh"]
