ARG ubuntu_version=20.04
FROM vistart/ubuntu:${ubuntu_version}
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get install zip unzip -y
RUN mkdir /data
WORKDIR /root
ARG redis_branch=6.0
RUN wget https://github.com/antirez/redis/archive/${redis_branch}.zip && unzip ${redis_branch}.zip
RUN cd redis-${redis_branch}
RUN apt-get install gcc automake autoconf libtool make -y
RUN make BUILD_TLS=yes MALLOC=jemalloc V=1
RUN makte test
RUN ./utils/gen-test-certs.sh
RUN ./runtest --tls
RUN make distclean
RUN make install
WORKDIR /data
