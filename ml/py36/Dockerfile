FROM vistart/cuda:10.0-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.sjtu	
RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && apt-get update && apt-get install -y locales tzdata
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
RUN pip3 install --no-cache-dir numpy \
                                mock \
                                protobuf \
                                absl-py \
                                tensorflow-gpu \
                                keras \
                                jupyter \
                                cython \
                                mmcv \
                                https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl \
                                https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp36-cp36m-linux_x86_64.whl \
                                sklearn \
                                scipy \
                                pandas \
                                scikit-image \
                                scikit-learn
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak	
RUN mv /etc/apt/sources.list.sjtu /etc/apt/sources.list