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
    cd /usr/src && \
    wget https://downloads.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.36-39/binary/tarball/Percona-Server-5.7.36-39-Linux.x86_64.glibc2.12-minimal.tar.gz -O percona.tar.gz && \
    yum update -y && \
    yum install -y pigz* libaio.x86_64 numactl && \
    yum install -y centos-release-scl && \
    yum install -y rh-ruby27 which && \
    scl enable rh-ruby27 bash && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    cd /tmp/ && \
    curl -sSL get.dbsake.net > /usr/local/bin/dbsake && \
    chmod +x /usr/local/bin/dbsake && \
    rm -rf /tmp/*
