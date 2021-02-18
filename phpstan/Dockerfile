FROM ghcr.io/phpstan/phpstan:latest

RUN apk --update --progress --no-cache add icu-dev libxml2-dev \
	&& docker-php-ext-install intl sockets