ARG TAG=apache
FROM php:${TAG}
LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www

# Require xdebug, mongodb, timezone, imagick, igbinary, amqp, libsodium extensions
RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install -y -qq axel wget \
                       git \
                       zlib1g-dev \
                       libzip-dev \
                       zip \
                       unzip \
                       libmcrypt-dev \
                       libicu-dev \
                       libpng-dev \
                       libonig-dev \
                       imagemagick \
                       libfreetype6-dev \
                       libjpeg62-turbo-dev \
                       libwebp-dev \
                       libmagickwand-dev \
                       openssl \
                       libssl-dev \
                       librabbitmq-dev \
                       libpq-dev \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*
# RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && sed -i 's/http/https/g' /etc/apt/sources.list
WORKDIR /tmp
RUN pecl channel-update pecl.php.net && pecl download https://pecl.php.net/get/xdebug https://pecl.php.net/get/mongodb https://pecl.php.net/get/timezonedb https://pecl.php.net/get/imagick https://pecl.php.net/get/igbinary https://pecl.php.net/get/amqp https://pecl.php.net/get/libsodium https://pecl.php.net/get/mcrypt https://pecl.php.net/get/redis && axel -q -o libsodium.tar.gz https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
