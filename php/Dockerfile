ARG TAG=apache
FROM php:${TAG}
LABEL maintainer "vistart <i@vistart.me>"

ENV APACHE_DOCUMENT_ROOT /var/www

# Require xdebug, mongodb, timezone, imagick, igbinary, amqp, libsodium extensions
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/http/https/g' /etc/apt/sources.list