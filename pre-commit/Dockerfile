FROM dokify/dind:0.0.2

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    openssh-client && \
    pip3 install pre-commit && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* \
