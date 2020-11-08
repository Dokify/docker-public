FROM alpine

ENV PACKER_BINARY_URL "https://releases.hashicorp.com/packer/1.6.5/packer_1.6.5_linux_amd64.zip"

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk add --no-cache curl cloud-utils gettext ansible \
    && curl ${PACKER_BINARY_URL} --output /tmp/packer.zip \
    && cd /tmp \
    && unzip packer.zip \
    && mv packer /usr/local/bin \
    && rm packer.zip

CMD ["/usr/local/bin/packer", "$@"]