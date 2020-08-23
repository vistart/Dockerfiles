ARG ubuntu=vistart/ubuntu
FROM ${ubuntu}:20.04
LABEL maintainer "vistart <i@vistart.vip>"

ADD filelist /root
RUN mkdir output
WORKDIR /root/output
RUN for line in $(cat ../filelist); \ 
    do \
      wget "${line}"; \ 
    done
