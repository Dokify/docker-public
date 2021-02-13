FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    openssh-client \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    curl \
    tini \
    git \
    make \
    kmod \
    procps && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y docker-ce && \
    apt-get autoclean && \
    curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    pip3 install pre-commit && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*
