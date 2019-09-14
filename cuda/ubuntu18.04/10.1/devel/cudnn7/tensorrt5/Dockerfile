ARG CUDA_VERSION=10.1
FROM vistart/cuda:${CUDA_VERSION}-cudnn7-devel-ubuntu18.04

LABEL maintainer="vistart <i@vistart.me>"

# Install requried libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    wget \
    zlib1g-dev \
    git \
    pkg-config \
    python3 \
    python3-pip

RUN cd /usr/local/bin &&\
    ln -s /usr/bin/python3 python &&\
    ln -s /usr/bin/pip3 pip

# Install Cmake
RUN cd /tmp &&\
    wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.sh &&\
    chmod +x cmake-3.14.4-Linux-x86_64.sh &&\
    ./cmake-3.14.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license &&\
    rm ./cmake-3.14.4-Linux-x86_64.sh

# Set environment and working directory
ENV TRT_RELEASE /tensorrt
ENV TRT_SOURCE /workspace/TensorRT
WORKDIR /workspace

RUN ["/bin/bash"]