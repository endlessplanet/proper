#!/bin/sh

export NETWORK=$(sudo docker network create $(uuidgen)) &&
    sudo docker \
        container \
        create \
        --tty \
        --cidfile ${HOME}/sshd.cid \
        endlessplanet/sshd:0.0.5 &&
    sudo docker network connect --alias sshd ${NETWORK} $(cat ${HOME}/sshd.cid) &&
    export SSHD=$(cat ${HOME}/sshd.cid) &&
    sudo docker container start ${SSHD} &&
    sudo docker \
        container \
        create \
        --tty \
        --cidfile ${HOME}/shell.cid \
        endlessplanet/shell:0.0.5 &&
    sudo docker network connect --alias shell ${NETWORK} $(cat ${HOME}/shell.cid) &&
    sudo docker container start $(cat ${HOME}/shell.cid) &&
    sudo docker \
        container \
        create \
        --tty \
        --cidfile ${HOME}/cloud9.cid \
        endlessplanet/cloud9:0.0.5 &&
    bash &&
    sudo docker container stop ${SSHD} $(cat ${HOME}/shell.cid) &&
    sudo docker container rm ${SSHD} $(cat ${HOME}/shell.cid) &&
    sudo docker network rm ${NETWORK}
