#!/bin/bash
REMOTE="/code_dir/remote.sh"
CURRENT_VERSION=`${REMOTE} "docker inspect --format '{{ .Config.Image }}' updater" | awk -F ":" {'print $2'}`
NEW_VERSION='new_version'

echo $NEW_VERSION
echo $CURRENT_VERSION

if [ "$CURRENT_VERSION" != "$NEW_VERSION" ];
then
    /code_dir/update_code.sh --updater update
fi

while true; do echo Run New Client Code; sleep 1; done
