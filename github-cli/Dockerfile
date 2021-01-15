FROM debian:buster

RUN apt update && \
    apt install --no-install-recommends -y \
      apt-transport-https \
      ca-certificates \
      gnupg2 \
      curl \
      tini \
      git && \
    curl -fsSL https://github.com/cli/cli/releases/download/v1.4.0/gh_1.4.0_linux_amd64.deb -o gh.deb && \
    dpkg -i gh.deb && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*


