#!/bin/bash -eu

export MSYS_NO_PATHCONV=1

(
  cd "$(dirname "$0")"
  source ./.env

  docker stop "minecraft-server-${WORLD_NAME:-default_world}"
)
