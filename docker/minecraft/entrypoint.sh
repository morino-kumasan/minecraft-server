#!/bin/sh -eux

# world dir
mkdir -p "/minecraft/worlds/${WORLD_NAME}"
cd "/minecraft/worlds/${WORLD_NAME}"

# agree minecraft eula
if [[ -f eula.txt ]]; then
  grep -q '^eula=false$' eula.txt && sed -i -e "s/^eula=false$/eula=${EULA}/g" eula.txt
fi

# start server
exec java "-Xmx${HEAP_MAX}" "-Xms${HEAP_INIT}" -jar /minecraft/paper.jar nogui
