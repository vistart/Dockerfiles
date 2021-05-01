ARG ubuntu=14.04
FROM ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

RUN if [ $(uname -m) = 'x86_64' -o $(uname -m) = 'x86' ]; then \
        sed -i "s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list ; \
        sed -i "s/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list ; \
    else \
        sed -i "s/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list ; \
    fi
RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install apt-transport-https ca-certificates git wget -y -qq && apt-get autoremove -y -qq && apt-get clean && rm -rf /var/lib/apt/list/*
