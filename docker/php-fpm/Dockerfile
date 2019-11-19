FROM php:7.3-fpm-alpine

RUN set -eux && \
  apk update && \
  apk add --update --no-cache --virtual=.build-deps \
    autoconf \
    gcc \
    g++ \
    make \
    tzdata && \
  apk add --update --no-cache \
    icu-dev \
    libzip-dev && \
  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  echo Asia/Tokyo > /etc/timezone && \
  pecl install xdebug && \
  apk del .build-deps && \
  docker-php-ext-install intl pdo_mysql mbstring zip bcmath && \
  docker-php-ext-enable xdebug