ARG ubuntu=20.04
FROM vistart/ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install gcc g++ clang clang++ build-essential gdb cmake tar curl zip unzip git ninja-build -y && apt-get clean && rm -rf /var/lib/apt/list/*
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
