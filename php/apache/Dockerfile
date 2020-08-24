ARG TAG=apache
# FROM registry.cn-hongkong.aliyuncs.com/vistart_public/php_official:${TAG}
FROM php:${TAG}
LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www

# Require xdebug, mongodb, timezone, imagick, igbinary, amqp, libsodium extensions
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y axel wget \
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
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*
