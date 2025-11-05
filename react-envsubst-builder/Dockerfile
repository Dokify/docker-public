ARG NODE_VERSION=${NODE_VERSION:-18}
FROM node:${NODE_VERSION}-bookworm

ONBUILD ARG NODE_ENV=${NODE_ENV:-production}
ONBUILD ENV NODE_ENV ${NODE_ENV}

ONBUILD WORKDIR /app
ONBUILD COPY --from=0 /app /app

ONBUILD RUN corepack enable && corepack prepare yarn@1.22.22 --activate

ONBUILD ENV NODE_OPTIONS=--openssl-legacy-provider

ONBUILD RUN (rm .env*|| true) && grep -R "process.env." src| \
       sed 's/^.*\(process.env.[a-zA-Z_0-9]*\).*$/\1/'| \
       egrep -v 'PUBLIC_URL'| \
       sort|uniq| \
       awk -F '.' '{print $3"=\"\${"$3"}\""}'| tee .env >/dev/null && \
       yarn build && rm .env

#need define ENV CHUNK_FOLDER /app/build/static/js/*.js where path is nginx public location containing js files builded
COPY envsubst-react-environment.sh /envsubst-react-environment.sh
COPY chunk-replacer.sh /chunk-replacer.sh
