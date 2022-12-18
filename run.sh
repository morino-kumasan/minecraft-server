#!/bin/bash -eu

export MSYS_NO_PATHCONV=1

(
  cd "$(dirname "$0")"
  source ./.env
  WORLD_NAME=${WORLD_NAME:-default_world}

  # ビルド
  docker build \
    -t minecraft \
    --build-arg MINECRAFT_VERSION=${MINECRAFT_VERSION:-1.19.3} \
    --build-arg PAPER_MINOR_VERSION=${PAPER_MINOR_VERSION:-345} \
    ./docker/minecraft

  # 起動
  docker run -itd \
    --mount "type=bind,src=$(pwd)/worlds,dst=/minecraft/worlds" \
    -e EULA=true \
    -e "WORLD_NAME=${WORLD_NAME}" \
    -e "HEAP_INIT=${HEAP_INIT:-1024M}" \
    -e "HEAP_MAX=${HEAP_MAX:-1024M}" \
    -p ${LISTEN_PORT:-25565}:25565 \
    --restart unless-stopped \
    --name "minecraft-server-${WORLD_NAME}" \
    minecraft
)
