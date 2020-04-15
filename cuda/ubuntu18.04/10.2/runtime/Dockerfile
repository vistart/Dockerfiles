ARG repository=vistart/cuda
FROM ${repository}:10.2-base-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV NCCL_VERSION 2.6.4

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-$CUDA_PKG_VERSION \
        cuda-nvtx-$CUDA_PKG_VERSION \
        libnccl2=$NCCL_VERSION-1+cuda10.2 && \
    apt-mark hold libnccl2 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean

