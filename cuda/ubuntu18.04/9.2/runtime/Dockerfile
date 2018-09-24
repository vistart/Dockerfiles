ARG repository=vistart/cuda
FROM ${repository}:9.2-base-1804
LABEL maintainer "vistart <i@vistart.me>"

ENV NCCL_VERSION 2.2.13

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-$CUDA_PKG_VERSION \
    cuda-nvtx-$CUDA_PKG_VERSION \
    libnccl2=$NCCL_VERSION-1+cuda9.2 && \
    rm -rf /var/lib/apt/lists/*
    