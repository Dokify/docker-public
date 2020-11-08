FROM dokify/packer:0.0.1 as packer
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gnupg2 python3-pip sshpass git openssh-client \
    curl \
    unzip \
    sudo \
    qemu-system-x86 \
    cloud-image-utils \
    gettext-base && \
    rm -rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && rm -Rf /usr/share/man && \
    apt-get clean

RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==2.10.0 && \
    pip install mitogen ansible-lint jmespath && \
    pip install --upgrade pywinrm

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

COPY --from=packer /usr/local/bin/packer /usr/local/bin/packer

WORKDIR /app

USER root
