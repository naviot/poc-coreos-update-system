#!/bin/bash

REMOTE="/code_dir/systemd/remote.sh"

mkdir -p /rootfs/root/.ssh
cat /root/.ssh/id_rsa.pub  > /rootfs/root/.ssh/authorized_keys

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    --client)
    SERVICE="client"
    CFG="/rootfs/etc/systemd/system/${SERVICE}.service"
    echo "Run Update ${SERVICE}..."
    $REMOTE "stop ${SERVICE}.service"
    sed -i -e 's/old/new/g' $CFG
    $REMOTE "daemon-reload"
    $REMOTE "start ${SERVICE}.service"
    echo "Finish Update ${SERVICE}"
    shift
    ;;
    --updater)
    SERVICE="updater"
    CFG="/rootfs/etc/systemd/system/${SERVICE}.service"
    echo "Run Update ${SERVICE}..."
    $REMOTE "stop ${SERVICE}.service"
    sed -i -e 's/old/new/g' $CFG
    $REMOTE "daemon-reload"
    $REMOTE "start ${SERVICE}.service"
    echo "Finish Update ${SERVICE}"
    shift
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
    ;;
esac
shift
done
