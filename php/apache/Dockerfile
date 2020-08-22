ARG TAG=apache
FROM registry.cn-hongkong.aliyuncs.com/vistart_public/php_official:${TAG}
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
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN axel -q -o libsodium.tar.gz https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && tar -xzf libsodium.tar.gz && cd libsodium-stable && ./configure && make && make check && make install
RUN pecl install https://pecl.php.net/get/xdebug \
                 https://pecl.php.net/get/mongodb \
                 https://pecl.php.net/get/timezonedb \
                 https://pecl.php.net/get/imagick \
                 https://pecl.php.net/get/igbinary \
                 https://pecl.php.net/get/amqp \
                 https://pecl.php.net/get/libsodium \
                 https://pecl.php.net/get/mcrypt
RUN docker-php-ext-configure gd --with-freetype	 --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) bcmath \
                                      intl \
                                      mbstring \
                                      mysqli \
                                      pcntl \
                                      pdo \
                                      pdo_mysql \
                                      gd \
                                      zip \
                                      iconv && \
    docker-php-ext-enable xdebug \
                          mongodb \
                          timezonedb \
                          imagick \
                          igbinary \
                          amqp \
                          sodium \
                          mcrypt

# Install Composer
ADD composer-setup.sh /root
RUN chmod +x /root/composer-setup.sh && /root/composer-setup.sh

# Change DocumentRoot
# Remove the comment character(#) if needed.
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Enable SSL Module
RUN a2enmod ssl

# AllowOverride

RUN sed -i '172s/None/All/' /etc/apache2/apache2.conf

# Enable RewriteEngine
RUN a2enmod rewrite

# Disable default website
RUN a2dissite 000-default.conf
