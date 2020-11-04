FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

USER root
WORKDIR /app

SHELL [ "/bin/bash", "-c" ]

RUN apt-get update && apt-get install -yq --no-install-recommends gnupg \
    && apt-get update && apt-get install -yq --no-install-recommends \
        autoconf build-essential libtool git wget libpng-dev libtiff5-dev zlib1g-dev zlibc ca-certificates automake \
        libleptonica-dev \
    && cd /tmp \
    && git clone https://github.com/tesseract-ocr/tesseract.git \
    && cd tesseract \
    && git checkout 3.04.01 \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && git clone https://github.com/tesseract-ocr/tessdata.git \
    && cd tessdata \
    && git checkout 3.04.00 \
    && mv spa* /usr/local/share/tessdata/ \
    && mv osd* /usr/local/share/tessdata/ \
    && mv eng* /usr/local/share/tessdata/ \
    && cd .. \
    && rm /tmp/* -rf \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && ldconfig

CMD ["tesseract"]