#!/bin/bash -eu

export MSYS_NO_PATHCONV=1

(
  cd "$(dirname "$0")"
  source ./.env
  WORLD_NAME=${WORLD_NAME:-default_world}

  docker stop "minecraft-server-${WORLD_NAME}"
  docker logs -f "minecraft-server-${WORLD_NAME}"

  # backup
  cd ./worlds
  if [[ -d "${WORLD_NAME}/world" ]]; then
    tar -zcvf "${WORLD_NAME}_$(date +"%Y%m%d%H%M%S").tar.gz" "${WORLD_NAME}"
  fi
)
