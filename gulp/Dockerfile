FROM node:10-alpine

ENV NPM_CONFIG_PREFIX ~/.npm-global
ENV PATH ${PATH}:~/.npm-global/bin

RUN apk add --no-cache python3 make g++ &&  \
    mkdir -p ~/.npm-global && \
    npm install -g --unsafe-perm node-sass && \
    npm install -g --unsafe-perm gulp-sass@4.0.2 && \
    npm install -g gulp@4.0.2 @babel/core@7.5.4 \
    @babel/code-frame@7.0.0 \
    @babel/generator@7.5.0 \
    @babel/helpers@7.5.4 \
    @babel/parser@7.5.0 \
    @babel/template@7.4.4 \
    @babel/traverse@7.5.0 \
    @babel/types@7.5.0 \
    fancy-log@1.3.3 \
    gulp-babel@8.0.0 \
    resolve@1.11.1 \
    gulp-terser@1.2.0 \
    gulp-util@3.0.8 \
    gulp-cli@2.2.0 \
    lodash@4.17.14 \
    semver@5.7.0 \
    fancy-log@1.3.3 \
    ansi-gray@0.1.1 \
    color-support@1.1.3 \
    parse-node-version@1.0.1 \
    time-stamp@1.1.0 \
    gulp-cli@2.2.0 \
    ansi-colors@1.1.0 \
    archy@1.0.0 \
    array-sort@1.0.0 \
    color-support@1.1.3 \
    concat-stream@1.6.2 \
    copy-props@2.0.4 \
    fancy-log@1.3.3 \
    gulplog@1.0.0 \
    interpret@1.2.0 \
    isobject@3.0.1 \
    liftoff@3.1.0 \
    matchdep@2.0.0 \
    mute-stdout@1.0.1 \
    pretty-hrtime@1.0.3 \
    replace-homedir@1.0.0 \
    semver-greatest-satisfied-range@1.1.0 \
    v8flags@3.1.3 \
    yargs@7.1.0 terser@4.1.2 && \
    npm link gulp-terser gulp-sass gulp-util gulp-babel gulp

WORKDIR /app

ENTRYPOINT [ "/root/.npm-global/bin/gulp" ]
