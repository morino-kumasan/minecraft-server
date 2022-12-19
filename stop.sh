#!/bin/bash -eu

export MSYS_NO_PATHCONV=1

(
  cd "$(dirname "$0")"

  if [[ -f ./.env ]]; then
    source ./.env
  fi

  WORLD_NAME=${WORLD_NAME:-default_world}

  # コンテナ停止してログ表示
  docker stop "mcserver-${WORLD_NAME}"
  docker logs -f "mcserver-${WORLD_NAME}"

  # コンテナは再利用しなくてよし
  docker rm "mcserver-${WORLD_NAME}"

  # バックアップ
  cd ./worlds
  if [[ -d "${WORLD_NAME}/world" ]]; then
    tar -zcvf "${WORLD_NAME}_$(date +"%Y%m%d%H%M%S").tar.gz" "${WORLD_NAME}"
  fi
)
