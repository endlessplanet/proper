#!/bin/sh

docker \
    container \
    run \
    --interactive \
    --tty \
    --rm \
    --entrypoint bash \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    endlessplanet/proper