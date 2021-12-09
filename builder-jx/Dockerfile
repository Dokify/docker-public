FROM ghcr.io/jenkins-x/builder-go:2.1.155-778-patch3

RUN cd /tmp && \
    curl -sSLO https://github.com/helm/chart-releaser/releases/download/v1.1.1/chart-releaser_1.1.1_linux_amd64.tar.gz && \
    curl -sSLO https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && \
    tar xvfz chart-releaser_1.1.1_linux_amd64.tar.gz && \
    chmod +x hey_linux_amd64 && \
    mv hey_linux_amd64 /usr/local/bin/hey && \
    mv cr /usr/local/bin/ && \
    curl -sSLO https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_amd64.zip && \
    unzip vault_1.9.0_linux_amd64.zip && \
    chmod +x ./vault && \
    mv vault /usr/local/bin/ && \
    rm -rf /tmp/*