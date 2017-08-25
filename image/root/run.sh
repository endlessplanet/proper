#!/bin/sh

dnf update --assumeyes &&
    dnf install --assumeyes sudo &&
    adduser user &&
    cp /opt/docker/user.sudo /etc/sudoers.d/user &&
    chmod 0444 /etc/sudoers.d/user &&
    dnf install --assumeyes dnf-plugins-core &&
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo &&
    dnf update --assumeyes &&
    dnf install --assumeyes dnf docker-common docker-latest &&
    usermod -a -G docker user &&
    dnf update --assumeyes &&
    dnf clean all