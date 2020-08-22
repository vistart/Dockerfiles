ARG ubuntu=19.10
FROM vistart/ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install gcc g++ clang build-essential gdb cmake curl zip unzip ninja-build -y && apt-get clean && rm -rf /var/lib/apt/list/*
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
