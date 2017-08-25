#!/bin/sh

bash
# NETWORK=$(sudo docker network create $(uuidgen)) &&
#     docker \
#         container \
#         run \
#         --detach \
#         --tty \
#         --cidfile ~/sshd.cid \
#         --network ${NETWORK} \
#         --hostname sshd \
#         --name sshd \
#         endlessplanet/sshd:0.0.5 &&
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