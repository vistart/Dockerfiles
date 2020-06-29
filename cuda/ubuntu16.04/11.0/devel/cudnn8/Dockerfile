ARG repository=vistart/cuda
FROM ${repository}:11.0-devel-ubuntu16.04
LABEL maintainer "vistart <i@vistart.me>"

ENV CUDNN_VERSION 8.0.0.180
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn8=$CUDNN_VERSION-1+cuda11.0 \
            libcudnn8-dev=$CUDNN_VERSION-1+cuda11.0 && \
    apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean
