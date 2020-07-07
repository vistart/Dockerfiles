ARG repository=vistart/cuda
FROM ${repository}:10.1-base-ubuntu16.04
LABEL maintainer "vistart <i@vistart.me>"

ENV NCCL_VERSION 2.7.6

RUN apt-get update && apt-get install -y --fix-missing --no-install-recommends \
        cuda-libraries-$CUDA_PKG_VERSION \
        cuda-nvtx-$CUDA_PKG_VERSION \
        libnccl2=$NCCL_VERSION-1+cuda10.1 && \
    apt-mark hold libnccl2 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean

