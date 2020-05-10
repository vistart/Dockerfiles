ARG ubuntu=14.04
FROM ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install apt-transport-https ca-certificates git wget -y && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/list/*
