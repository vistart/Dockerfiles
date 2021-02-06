ARG repository=vistart/cuda
FROM ${repository}:11.1-runtime-ubuntu20.04
LABEL maintainer "vistart <i@vistart.me>"

ENV CUDNN_VERSION 8.1.0.77
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn8=$CUDNN_VERSION-1+cuda11.1 && \
    apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean

