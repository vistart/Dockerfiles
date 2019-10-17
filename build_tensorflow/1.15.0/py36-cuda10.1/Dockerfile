ARG TENSORFLOW_BRANCH=r1.15
FROM vistart/cuda:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get install -y git \
                       python3 \
                       python3-pip \
                       openjdk-11-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       unzip
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel_0.26.1-linux-x86_64.deb && dpkg -i bazel_0.26.1-linux-x86_64.deb
RUN pip3 install numpy \
                 mock \
                 protobuf \
                 absl-py \
                 keras
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN cd root && git clone --recurse-submodules https://github.com/tensorflow/tensorflow
RUN cd /root/tensorflow && git checkout $TENSORFLOW_BRANCH