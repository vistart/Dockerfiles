ARG TF_BRANCH=r1.15
ARG BAZEL_RC_FILE=build_tensorflow/.tf_configure.bazelrc.py36
FROM vistart/cuda:10.0-cudnn7-tensorrt6-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get install -y git \
                       python3 \
                       python3-pip \
                       python3-libnvinfer=6.0.1-1+cuda10.0 \
                       python3-libnvinfer-dev=6.0.1-1+cuda10.0 \
                       uff-converter-tf=6.0.1-1+cuda10.0 \
                       openjdk-11-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       pkg-config \
                       zip \
                       unzip
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh && chmod +x bazel-0.26.1-installer-linux-x86_64.sh
RUN ./bazel-0.26.1-installer-linux-x86_64.sh --user && rm bazel-0.26.1-installer-linux-x86_64.sh
ENV PATH "$PATH:/root/bin"
RUN pip3 install numpy \
                 mock \
                 protobuf \
                 absl-py \
                 keras
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN cd root && git clone --recurse-submodules https://github.com/tensorflow/tensorflow
COPY $BAZEL_RC_FILE /root/tensorflow/.tf_configure.bazelrc
RUN cd /root/tensorflow && git checkout $TF_BRANCH && bazel build --nobuild //tensorflow/tools/pip_package:build_pip_package && bazel shutdown
