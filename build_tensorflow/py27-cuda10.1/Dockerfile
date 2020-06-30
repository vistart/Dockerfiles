FROM vistart/cuda:10.1-cudnn7-tensorrt6-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get install -y git \
                       python \
                       python-pip \
                       python-libnvinfer=6.0.1-1+cuda10.1 \
                       python-libnvinfer-dev=6.0.1-1+cuda10.1 \
                       uff-converter-tf=6.0.1-1+cuda10.1 \
                       openjdk-11-jdk \
                       curl \
                       libc-ares-dev \
                       wget \
                       zlib1g-dev \
                       bash-completion \
                       unzip
RUN pip install -U six \
                numpy \
                wheel \
                setuptools \
                mock \
                protobuf \
                absl-py \
                enum34 \
                keras \
                'future>=0.17.1'
RUN pip install -U keras_applications --no-deps
RUN pip install -U keras_preprocessing --no-deps
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2
RUN cd root && git clone --recurse-submodules https://github.com/tensorflow/tensorflow
WORKDIR /root/tensorflow
COPY build_tensorflow/.tf_configure.bazelrc.py27 ./.tf_configure.bazelrc
ARG BAZEL_URL=https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel_0.26.1-linux-x86_64.deb
RUN wget $BAZEL_URL -O bazel.deb && dpkg -i bazel.deb && rm bazel.deb
ARG TF_BRANCH=r1.15
RUN git checkout $TF_BRANCH && bazel build --nobuild //tensorflow/tools/pip_package:build_pip_package && bazel shutdown
