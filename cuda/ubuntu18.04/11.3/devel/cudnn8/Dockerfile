ARG repository=vistart/cuda
FROM ${repository}:11.3-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV CUDNN_VERSION 8.2.0.53
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn8=$CUDNN_VERSION-1+cuda11.3 \
            libcudnn8-dev=$CUDNN_VERSION-1+cuda11.3 && \
    apt-mark hold libcudnn8 && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get autoremove -y && apt-get clean
