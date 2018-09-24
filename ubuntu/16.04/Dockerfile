ARG ubuntu=16.04
FROM ubuntu:${ubuntu}
LABEL maintianer "vistart <i@vistart.me>"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources_xenial.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install apt-transport-https ca-certificates -y && rm /etc/apt/sources.list && apt-get clean
ADD sources_ssl_xenial.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y
