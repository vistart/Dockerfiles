ARG ubuntu=19.10
FROM ubuntu:${ubuntu}
LABEL maintianer "vistart <i@vistart.me>"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources_trusty.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install apt-transport-https ca-certificates -y && rm /etc/apt/sources.list && apt-get clean
ADD sources_ssl_eoan.list /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean
