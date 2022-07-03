ARG NODE_VERSION=${NODE_VERSION:-16}
FROM node:${NODE_VERSION}

ONBUILD ARG NODE_ENV=${NODE_ENV:-production}
ONBUILD ENV NODE_ENV ${NODE_ENV}

ONBUILD WORKDIR /app
ONBUILD COPY --from=0 /app /app

ONBUILD RUN grep -R "process.env." src| \
        sed 's/^.*\(process.env.[a-zA-Z_0-9]*\).*$/\1/'| \
        awk -F '.' '{print $3"=\"${"$3"}\""}'| \
        uniq|sort | \
        tee .env.template >/dev/null

ONBUILD RUN npm --location=global install env-cmd && \
            env-cmd -f .env.template --use-shell yarn run react-scripts build && \
            grep -R "process.env." src|sed 's/^.*\(process.env.[a-zA-Z_]*\).*$/\1/'|awk -F '.' '{print "$"$3","}'|xargs|sed "s/ //g" | tee .env.list >/dev/null

#need define ENV CHUNK_FOLDER /app/build/static/js/*.js where path is nginx public location containing js files builded
COPY envsubst-react-environment.sh /envsubst-react-environment.sh
