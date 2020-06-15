ARG ubuntu=20.04
FROM ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install apt-transport-https ca-certificates git wget -qq -y && apt-get autoremove -qq -y && apt-get clean && rm -rf /var/lib/apt/list/*
RUN sed -i "s/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list
