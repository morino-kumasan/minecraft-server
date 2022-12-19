#!/bin/bash -eu

export MSYS_NO_PATHCONV=1

(
  cd "$(dirname "$0")"

  if [[ -f ./.env ]]; then
    source ./.env
  fi

  tag=papermc-${MINECRAFT_VERSION:-1.19.3}-${PAPER_MINOR_VERSION:-346}

  docker build \
    -t ${tag} \
    --build-arg MINECRAFT_VERSION=${MINECRAFT_VERSION:-1.19.3} \
    --build-arg PAPER_MINOR_VERSION=${PAPER_MINOR_VERSION:-346} \
    ./docker/minecraft
)
