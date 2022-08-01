FROM php:8.0.6-fpm-alpine
#https://gitlab.com/daverona/pre-commit
WORKDIR /app

RUN apk add --no-cache \
    bash \
    composer \
    php8 \
    php8-dom \
    php8-simplexml \
    php8-tokenizer \
    php8-xml \
    php8-xmlwriter \
  && composer require --no-cache --optimize-autoloader \
    phpmd/phpmd:2.12.0  \
  && rm -rf /root/.composer

COPY pre-commit-hooks/ /app/pre-commit-hooks/
RUN chmod a+x /app/pre-commit-hooks/*
ENV PATH=/app/vendor/bin:/app/pre-commit-hooks:$PATH

CMD ["phpmd"]
