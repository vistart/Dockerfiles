ARG TF_BRANCH r1.15
ARG BAZEL_RC_FILE build_tensorflow/.tf_configure.bazelrc.py27
FROM vistart/cuda:10.0-cudnn7-tensorrt6-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get install -y git \
                       python \
                       python-pip \
                       python-libnvinfer-dev \
                       uff-converter-tf \
                       openjdk-11-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       unzip
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel_0.26.1-linux-x86_64.deb && dpkg -i bazel_0.26.1-linux-x86_64.deb
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
RUN cd root && git clone --recurse-submodules -b $TF_BRANCH https://github.com/tensorflow/tensorflow
COPY $BAZEL_RC_FILE tensorflow/.tf_configure.bazelrc
RUN bazel build --nobuild //tensorflow/tools/pip_package:build_pip_package
