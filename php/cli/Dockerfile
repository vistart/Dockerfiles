ARG TAG=cli
FROM registry.cn-shanghai.aliyuncs.com/vistart_public/php_official:${TAG}
LABEL maintainer "vistart <i@vistart.me>"

WORKDIR /tmp
RUN axel -q -o libsodium.tar.gz https://download.libsodium.org/libsodium/releases/LATEST.tar.gz && tar -xzf libsodium.tar.gz && rm libsodium.tar.gz && cd libsodium-stable && ./configure && make && make check && make install
RUN pecl install xdebug mongodb timezonedb imagick igbinary amqp libsodium mcrypt
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
WORKDIR /root
# Install Composer
ADD composer-setup.sh /root
RUN apt-get update && apt-get install dos2unix -y && dos2unix /root/composer-setup.sh && apt-get remove dos2unix -y && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN chmod +x /root/composer-setup.sh && /root/composer-setup.sh && rm /root/composer-setup.sh

WORKDIR /root
