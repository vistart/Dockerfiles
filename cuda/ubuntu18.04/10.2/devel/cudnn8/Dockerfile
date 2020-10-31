ARG repository=vistart/cuda
FROM ${repository}:10.2-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV CUDNN_VERSION 8.0.4.30
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn8=$CUDNN_VERSION-1+cuda10.2 \
            libcudnn8-dev=$CUDNN_VERSION-1+cuda10.2 && \
    apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean
