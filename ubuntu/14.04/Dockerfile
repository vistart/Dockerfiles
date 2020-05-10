ARG ubuntu=14.04
FROM ubuntu:${ubuntu}
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update -qq && apt-get upgrade -y -qq && apt-get install apt-transport-https ca-certificates git wget -y -qq && apt-get autoremove -y -qq && apt-get clean && rm -rf /var/lib/apt/list/*
