FROM dokify/prestissimo as backend

WORKDIR /src

COPY composer.json /src
COPY pdfparser.php /src

RUN composer install \
    --ignore-platform-reqs \
    --no-ansi \
    --no-autoloader \
    --no-dev \
    --no-interaction \
    --no-scripts

RUN composer dump-autoload --no-dev --optimize --classmap-authoritative

FROM php:7.2.9-alpine

WORKDIR /src
COPY --from=backend --chown=www-data:www-data /src /src

CMD ["/usr/local/bin/php", "/srcpdfparser.php"]
