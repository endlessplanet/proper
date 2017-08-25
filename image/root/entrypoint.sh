#!/bin/sh

export NETWORK=$(sudo docker network create $(uuidgen)) &&
    sudo docker \
        container \
        run \
        --detach \
        --tty \
        --cidfile ~/sshd.cid \
        --network ${NETWORK} \
        endlessplanet/sshd:0.0.5 &&
    sudo docker network connect --alias sshd ${NETWORK} $(cat ~/.sshd.cid) &&
    export SSHD=$(cat ~/.sshd.cid) &&
    bash
#     docker \
#         container \
#         run \
#         --detach \
#         --tty \
#         --rm \
#         --env DISPLAY \
#         --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
#         --device /dev/dri/card0 \
#         --volume /run/user/1000/pulse/native:/tmp/pulse:ro \
#         --volume /dev/shm:/home/user/Download \
#         --network ${NETWORK} \
#         sassmann/debian-chromium