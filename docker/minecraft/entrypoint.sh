#!/bin/sh -eu

world="/minecraft/worlds/${WORLD_NAME}"
mkdir -p "${world}"
cd "${world}"

exec java "-Xmx${HEAP_MAX}" "-Xms${HEAP_INIT}" -jar /minecraft/paper.jar nogui
