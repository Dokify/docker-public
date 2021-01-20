FROM ubuntu:20.04 as backend

RUN apt update \
    && apt install -yq --no-install-recommends curl gnupg2 ca-certificates wget \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update \
    && apt install yarn nodejs -yq --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

EXPOSE 3000

CMD [ "yarn", "start" ]
