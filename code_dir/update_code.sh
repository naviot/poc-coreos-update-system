#!/bin/bash

REMOTE="/code_dir/remote.sh"

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    --client)
    SERVICE="client"
    CFG="/rootfs/etc/systemd/system/${SERVICE}.service"
    echo "Run Update ${SERVICE}..."
    $REMOTE "sudo systemctl stop ${SERVICE}.service"
    sed -i -e 's/old/new/g' $CFG
    $REMOTE "sudo systemctl daemon-reload"
    $REMOTE "sudo systemctl start ${SERVICE}.service"
    echo "Finish Update ${SERVICE}"
    shift
    ;;
    --updater)
    SERVICE="updater"
    CFG="/rootfs/etc/systemd/system/${SERVICE}.service"
    echo "Run Update ${SERVICE}..."
    $REMOTE "sudo systemctl stop ${SERVICE}.service"
    sed -i -e 's/old/new/g' $CFG
    $REMOTE "sudo systemctl daemon-reload"
    $REMOTE "sudo systemctl start ${SERVICE}.service"
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
