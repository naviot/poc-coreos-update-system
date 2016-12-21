#!/bin/bash
HOST_IP="172.17.0.1"
HOST_USR="core"
REMOTE="ssh -i /rootfs/home/core/priv.key ${HOST_USR}@${HOST_IP}"

$REMOTE $1
