FROM vistart/cuda:10.0-cudnn7-tensorrt7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get install -y git \
                       python \
                       python-pip \
                       python-libnvinfer=7.0.0-1+cuda10.0 \
                       python-libnvinfer-dev=7.0.0-1+cuda10.0 \
                       uff-converter-tf=7.0.0-1+cuda10.0 \
                       openjdk-11-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       unzip
ARG BAZEL_URL=https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh
RUN wget $BAZEL_URL -O bazel.sh && chmod +x bazel.sh
RUN ./bazel.sh --user && rm bazel.sh
RUN pip install numpy \
                mock \
                protobuf \
                absl-py \
                enum34 \
                keras \
                future
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN cd root && git clone --recurse-submodules https://github.com/tensorflow/tensorflow
WORKDIR /root/tensorflow
COPY build_tensorflow/.tf_configure.bazelrc.py27 ./.tf_configure.bazelrc

ARG TF_BRANCH=r1.15
RUN git checkout $TF_BRANCH && bazel build --nobuild //tensorflow/tools/pip_package:build_pip_package && bazel shutdown
