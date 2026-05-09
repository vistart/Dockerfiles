ARG TAG=8.5-cli
ARG PHP_VERSION=8.5

FROM php:${TAG} AS base

LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www
ENV PHP_VERSION=${PHP_VERSION}

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install -y -qq axel wget python3-dev \
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

WORKDIR /tmp
RUN pecl channel-update pecl.php.net && \
    PACKAGES="https://pecl.php.net/get/xdebug https://pecl.php.net/get/mongodb https://pecl.php.net/get/timezonedb https://pecl.php.net/get/imagick https://pecl.php.net/get/igbinary https://pecl.php.net/get/amqp https://pecl.php.net/get/libsodium https://pecl.php.net/get/mcrypt https://pecl.php.net/get/redis https://pecl.php.net/get/phpy" && \
    DOWNLOAD="" && \
    for pkg in $PACKAGES; do \
        name=$(basename $pkg); \
        case $name in \
            phpy)    [ "$PHP_VERSION" != "8.4" ] && DOWNLOAD="$DOWNLOAD $pkg" ;; \
            mcrypt)  [ "$PHP_VERSION" != "8.2" ] && [ "$PHP_VERSION" != "8.3" ] && [ "$PHP_VERSION" != "8.4" ] && DOWNLOAD="$DOWNLOAD $pkg" ;; \
            imagick) [ "$PHP_VERSION" != "8.3" ] && [ "$PHP_VERSION" != "8.4" ] && DOWNLOAD="$DOWNLOAD $pkg" ;; \
            amqp)    [ "$PHP_VERSION" != "8.5" ] && DOWNLOAD="$DOWNLOAD $pkg" ;; \
            *)       DOWNLOAD="$DOWNLOAD $pkg" ;; \
        esac; \
    done && \
    pecl download $DOWNLOAD && \
    axel -q -o libsodium.tar.gz https://download.libsodium.org/libsodium/releases/LATEST.tar.gz

FROM base AS builder

WORKDIR /tmp
RUN tar -xzf libsodium.tar.gz && rm libsodium.tar.gz && cd libsodium-stable && ./configure && make && make install

RUN PECL="" && for f in *.tgz; do PECL="$PECL $(basename $f .tgz)"; done && \
    if [ "$PHP_VERSION" != "8.4" ]; then printf "\n" | pecl install phpy; fi && \
    pecl install $PECL && rm -f *.tgz phpy

FROM php:${TAG} AS final

LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www
ENV PHP_VERSION=${PHP_VERSION}

COPY --from=base /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=base /var/lib/apt/lists /var/lib/apt/lists
COPY --from=builder /usr/local/lib/php/extensions /usr/local/lib/php/extensions

RUN apt-get update -qq && apt-get install -y -qq axel wget python3-dev \
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

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-configure soap && \
    docker-php-ext-configure pdo_pgsql && \
    docker-php-ext-install -j$(nproc) bcmath intl mbstring mysqli pcntl pdo pdo_mysql gd zip iconv soap pdo_pgsql

RUN docker-php-ext-enable xdebug mongodb timezonedb igbinary redis && \
    if [ "$PHP_VERSION" != "8.3" ] && [ "$PHP_VERSION" != "8.4" ]; then docker-php-ext-enable imagick; fi && \
    if [ "$PHP_VERSION" != "8.2" ] && [ "$PHP_VERSION" != "8.3" ] && [ "$PHP_VERSION" != "8.4" ]; then docker-php-ext-enable mcrypt; fi && \
    if [ "$PHP_VERSION" != "8.5" ]; then docker-php-ext-enable amqp; fi && \
    docker-php-ext-enable sodium && \
    if [ "$PHP_VERSION" != "8.4" ]; then docker-php-ext-enable phpy; fi

RUN ldconfig

COPY composer-setup.sh /root/composer-setup.sh
RUN chmod +x /root/composer-setup.sh && /root/composer-setup.sh && rm /root/composer-setup.sh

WORKDIR /root