#!/usr/bin/env bash

set -eux

worker="worker"

sudo rm -rf bb "${worker}"
mkdir -m 0777 "${worker}" "${worker}/build"
mkdir -m 0700 "${worker}/cache"
mkdir -m 0700 -p storage-cas-0/persistent_state                                                                                                                                                        
mkdir -m 0700 -p storage-{ac,cas}-{0,1}/persistent_state

exec docker-compose up
