FROM composer

RUN set -eux && \
    apk update && \
    apk add --update --no-cache unzip && \
    composer config -g repos.packagist composer https://packagist.jp && \
    composer global require "hirak/prestissimo"

ENV PATH $PATH:/tmp/vendor/bin