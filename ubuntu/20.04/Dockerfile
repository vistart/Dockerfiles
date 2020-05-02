ARG ubuntu=20.04
FROM ubuntu:${ubuntu}
LABEL maintianer "vistart <i@vistart.me>"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install ca-certificates -y
ADD sources_ssl.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && rm -rf /var/lib/apt/list/*
