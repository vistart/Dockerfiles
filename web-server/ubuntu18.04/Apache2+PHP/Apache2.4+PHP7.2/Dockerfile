FROM vistart/ubuntu:18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y apache2 apache2-dev php php7.2-dev php-mbstring php-gettext php-imagick
ADD composer-setup.sh /root
RUN cd /root && chmod +x composer-setup.sh && ./composer-setup.sh

