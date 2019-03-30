ARG TENSORFLOW_BRANCH=r1.13
FROM vistart/cuda:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install tzdata -y
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
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
RUN pip3 install numpy \
                 mock \
                 protobuf \
                 absl-py \
                 tensorflow-gpu \
                 keras \
                 jupyter \
                 cython \
                 mmcv \
                 https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl \
                 torchvision \
                 sklearn \
                 scipy \
                 pandas \
                 scikit-image \
                 scikit-learn
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN ln -s /usr/bin/python3 /usr/bin/python