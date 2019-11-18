FROM vistart/cuda:10.0-cudnn7-tensorrt6-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y locales tzdata
RUN locale-gen en_US.UTF-8
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata && dpkg-reconfigure locales
ENV LANG en_US.UTF-8
RUN apt-get install -y git \
                       python3 \
                       python3-pip \
                       openjdk-8-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       unzip \
                       vim \
                       libsm6 \
                       libxrender1 \
                       libfontconfig1 \
                       python3-opencv
RUN apt-get autoremove -y && apt-get clean
RUN pip3 install --no-cache-dir numpy \
                                mock \
                                protobuf \
                                absl-py \
                                keras \
                                cython \
                                torch \
                                torchvision \
                                sklearn \
                                scipy \
                                pandas \
                                scikit-image \
                                scikit-learn
ARG TF_VERSION=1.15.0
RUN wget https://github.com/vistart/Dockerfiles/releases/download/tensorflow-$TF_VERSION/tensorflow-$TF_VERSION-cp36-cp36m-linux_x86_64-cuda10.0.whl -O tensorflow-$TF_VERSION-cp36-cp36m-linux_x86_64.whl && pip3 install tensorflow-$TF_VERSION-cp36-cp36m-linux_x86_64.whl
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN ln -s /usr/bin/python3 /usr/bin/python