FROM php:7.2.10-apache-stretch
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get install -y wget git zlib1g-dev zip unzip libicu-dev libpng-dev imagemagick libfreetype6-dev libjpeg62-turbo-dev libmagickwand-dev
RUN pecl install  https://pecl.php.net/get/xdebug https://pecl.php.net/get/mongodb https://pecl.php.net/get/timezonedb https://pecl.php.net/get/imagick
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include && \
    docker-php-ext-install -j$(nproc) intl mbstring mysqli pdo pdo_mysql gd zip iconv && \
    docker-php-ext-enable xdebug mongodb timezonedb imagick
ADD composer-setup.sh /root
RUN /root/composer-setup.sh
