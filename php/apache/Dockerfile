FROM php:apache
LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www

# Require xdebug, mongodb, timezone, imagick modules
RUN apt-get update && apt-get install -y wget git zlib1g-dev libzip zip unzip libicu-dev libpng-dev imagemagick libfreetype6-dev libjpeg62-turbo-dev libmagickwand-dev
RUN pecl install  https://pecl.php.net/get/xdebug https://pecl.php.net/get/mongodb https://pecl.php.net/get/timezonedb https://pecl.php.net/get/imagick
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include && \
    docker-php-ext-install -j$(nproc) intl mbstring mysqli pdo pdo_mysql gd zip iconv && \
    docker-php-ext-enable xdebug mongodb timezonedb imagick

# Install Composer
ADD composer-setup.sh /root
RUN chmod +x /root/composer-setup.sh && /root/composer-setup.sh

# Change DocumentRoot
# Remove the comment character(#) if needed.
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# AllowOverride

RUN sed -i '172s/None/All/' /etc/apache2/apache2.conf

# Enable RewriteEngine
RUN a2enmod rewrite
