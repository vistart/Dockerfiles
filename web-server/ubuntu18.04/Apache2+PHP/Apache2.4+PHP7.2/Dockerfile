FROM vistart/ubuntu:18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apt-get install tzdata -y && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y apache2 apache2-dev php php7.2-dev php-mbstring php-gettext php-imagick wget
ADD composer-setup.sh /root
RUN cd /root && chmod +x composer-setup.sh && ./composer-setup.sh

