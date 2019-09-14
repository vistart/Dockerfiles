ARG repository=vistart/cuda
FROM ${repository}:9.2-devel-1604
LABEL maintainer "vistart <i@vistart.me>"

ENV CUDNN_VERSION 7.6.3.30
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda9.2 \
            libcudnn7-dev=$CUDNN_VERSION-1+cuda9.2 && \
    rm -rf /var/lib/apt/lists/*
