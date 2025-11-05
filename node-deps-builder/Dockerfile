ARG NODE_VERSION=${NODE_VERSION:-18}
FROM node:${NODE_VERSION}-bookworm-slim

ONBUILD WORKDIR /app

ONBUILD RUN apt-get update && apt-get install -y --no-install-recommends build-essential python3 git && npm install --location=global npm node-gyp && \
            apt-get -y clean && \
            apt-get clean autoclean && \
            apt-get autoremove --yes && \
            rm -rf /var/lib/{apt,dpkg,cache,log}

# Habilitar corepack para disponer de 'yarn' en Node 18+
ONBUILD RUN corepack enable

ONBUILD COPY package.json *package-lock.json *.npmrc yarn.lock *.nvmrc ./

ONBUILD ARG NODE_ENV=${NODE_ENV:-production}
ONBUILD ENV NODE_ENV ${NODE_ENV}

ONBUILD RUN mkdir node_modules 2>/dev/null && \
            touch ./node_modules/.metadata_never_index

ONBUILD RUN yarn install --skip-integrity-check \
            --non-interactive \
            --no-node-version-check \
            --production \
            --ignore-platform \
            --network-concurrency 1 \
            --no-progress

ONBUILD COPY . /app/
