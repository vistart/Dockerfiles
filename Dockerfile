FROM vistart/ubuntu:20.04
LABEL maintainer "vistart <i@vistart.vip>"

ADD filelist /root
WORKDIR /root
RUN for line in $(cat filelist) \
    do \
      wget $line \
    done
