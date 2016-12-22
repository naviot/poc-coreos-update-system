#!/bin/bash
HOST_IP="172.17.0.1"
HOST_USR="root"
REMOTE="systemctl --host ${HOST_USR}@${HOST_IP}"

$REMOTE $1
