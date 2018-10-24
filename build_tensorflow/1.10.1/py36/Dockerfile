ARG TENSORFLOW_BRANCH=r1.10
FROM vistart/cuda:10.0-cudnn7-tensorrt5-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3D5919B448457EE0
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update && \
    apt-get install -y git \
                       python3 \
                       python3-pip \
                       python3-libnvinfer-dev \
                       uff-converter-tf \
                       openjdk-8-jdk \
                       curl
RUN curl -s https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN apt-get update && apt-get install -y bazel 
RUN pip3 install numpy \
                 mock \
                 protobuf \
                 absl-py \
                 keras
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN cd root && git clone --recurse-submodules https://github.com/tensorflow/tensorflow && cd tensorflow
RUN git checkout $TENSORFLOW_BRANCH