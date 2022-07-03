ARG NODE_VERSION=${NODE_VERSION:-16}
FROM node:${NODE_VERSION}-slim

ONBUILD WORKDIR /app

ONBUILD RUN apt-get update && apt-get install -y build-essential python git && npm install --location=global npm node-gyp && \
            apt-get -y clean && \
            apt-get clean autoclean && \
            apt-get autoremove --yes && \
            rm -rf /var/lib/{apt,dpkg,cache,log}

ONBUILD COPY package.json *package-lock.json *.npmrc yarn.lock *.nvmrc ./

ONBUILD ARG NODE_ENV=${NODE_ENV:-production}
ONBUILD ENV NODE_ENV ${NODE_ENV}

ONBUILD ARG YARN_INSTALL_ARGS=${YARN_INSTALL_ARGS:-"--network-concurrency 1 --production --frozen-lockfile"}

ONBUILD RUN if [ -f yarn.lock ]; then yarn install ${YARN_INSTALL_ARGS}; else npm install; fi

ONBUILD COPY . /app/
