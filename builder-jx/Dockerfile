FROM gcr.io/jenkinsxio/builder-jx:2.1.155-778

RUN cd /tmp && \
    curl -sSLO https://github.com/helm/chart-releaser/releases/download/v1.1.1/chart-releaser_1.1.1_linux_amd64.tar.gz && \
    tar xvfz chart-releaser_1.1.1_linux_amd64.tar.gz && \
    mv cr /usr/local/bin/ && \
    rm -rf /tmp/*