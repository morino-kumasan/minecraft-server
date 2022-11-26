#!/bin/sh -eux

# backup
cd /minecraft/worlds
if [[ -d "${WORLD_NAME}" ]]; then
  tar -zcf "${WORLD_NAME}_$(date +"%Y%m%d%H%M%S").tar.gz" "${WORLD_NAME}"
fi

# world dir
mkdir -p "${WORLD_NAME}"
cd "${WORLD_NAME}"

# agree minecraft eula
if [[ -f eula.txt ]]; then
  grep -q '^eula=false$' eula.txt && sed -i -e "s/^eula=false$/eula=${EULA}/g" eula.txt
fi

# start server
exec java "-Xmx${HEAP_MAX}" "-Xms${HEAP_INIT}" -jar /minecraft/paper.jar nogui
