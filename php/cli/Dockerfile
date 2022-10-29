ARG TAG=cli
FROM registry.us-west-1.aliyuncs.com/vistart_public/php_official:${TAG}
LABEL maintainer "vistart <i@vistart.me>"

WORKDIR /tmp
RUN tar -xzf libsodium.tar.gz && rm libsodium.tar.gz && cd libsodium-stable && ./configure && make && make check && make install
RUN pecl install xdebug mongodb timezonedb imagick igbinary amqp libsodium mcrypt redis && rm xdebug mongodb timezonedb imagick igbinary amqp libsodium mcrypt redis
RUN docker-php-ext-configure gd --with-freetype	 --with-jpeg --with-webp && docker-php-ext-configure soap && \
    docker-php-ext-install -j$(nproc) bcmath \
                                      intl \
                                      mbstring \
                                      mysqli \
                                      pcntl \
                                      pdo \
                                      pdo_mysql \
                                      gd \
                                      zip \
                                      iconv \
                                      soap && \
    docker-php-ext-enable xdebug \
                          mongodb \
                          timezonedb \
                          imagick \
                          igbinary \
                          amqp \
                          sodium \
                          mcrypt \
                          redis
WORKDIR /root
# Install Composer
ADD composer-setup.sh /root
RUN chmod +x /root/composer-setup.sh && /root/composer-setup.sh && rm /root/composer-setup.sh

WORKDIR /root
