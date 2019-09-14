ARG repository=vistart/cuda
FROM ${repository}:9.2-base-1604
LABEL maintainer "vistart <i@vistart.me>"

ENV NCCL_VERSION 2.4.8

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-$CUDA_PKG_VERSION \
    cuda-nvtx-$CUDA_PKG_VERSION \
    libnccl2=$NCCL_VERSION-1+cuda9.2 && \
    rm -rf /var/lib/apt/lists/*
