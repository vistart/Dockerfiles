ARG repository=vistart/nsnam
FROM ${repository}:base
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get install wget -y && \
    cd /root && mkdir workspace && \
    cd workspace && \
    wget http://www.nsnam.org/release/ns-allinone-3.28.tar.bz2 && \
    tar xjf ns-allinone-3.28.tar.bz2 && \
    cd /root/workspace/ns-allinone-3.28 && \
    ./build.py --enable-examples --enable-tests

