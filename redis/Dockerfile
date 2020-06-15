ARG ubuntu_version=20.04
FROM vistart/ubuntu:${ubuntu_version}
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install zip unzip gcc automake autoconf libtool make libssl-dev tcl tcl-dev -y
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN mkdir /data
WORKDIR /root
ARG jemalloc_version=5.2.1
RUN wget https://github.com/jemalloc/jemalloc/archive/${jemalloc_version}.zip && unzip ${jemalloc_version}.zip && rm ${jemalloc_version}.zip && cd jemalloc-${jemalloc_version} && ./autogen.sh && make && make install
RUN cd /root
ARG redis_branch=6.0
RUN wget https://github.com/antirez/redis/archive/${redis_branch}.zip && unzip ${redis_branch}.zip && rm ${redis_branch}.zip
RUN cd redis-${redis_branch}/src && make BUILD_TLS=yes MALLOC=jemalloc V=1 && make distclean && make install
WORKDIR /data
