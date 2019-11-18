FROM vistart/cuda:10.0-cudnn7-tensorrt6-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y locales tzdata
RUN locale-gen en_US.UTF-8
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata && dpkg-reconfigure locales
ENV LANG en_US.UTF-8
RUN apt-get install -y git \
                       python \
                       python-pip \
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
                       python-opencv
RUN apt-get autoremove -y && apt-get clean
RUN pip install --no-cache-dir numpy \
                               mock \
                               protobuf \
                               absl-py \
                               keras \
                               cython \
                               sklearn \
                               'scipy<1.3' \
                               'pandas<0.24' \
                               'scikit-image<0.15' \
                               'scikit-learn<0.21' \
                               'PyWavelets<1.1' \
                               'networkx<2.3' \
                               'matplotlib<3.0' \
                               torch \
                               torchvision \
                               https://github.com/vistart/Dockerfiles/releases/download/tensorflow-1.15.0/tensorflow-1.15.0-cp27-cp27mu-linux_x86_64-cuda10.0.whl
RUN ln -s /usr/include/nccl.h /usr/local/cuda/include/nccl.h
RUN mkdir /usr/local/cuda/lib
RUN ln -s /usr/lib/x86_64-linux-gnu/libnccl.so.2 /usr/local/cuda/lib/libnccl.so.2