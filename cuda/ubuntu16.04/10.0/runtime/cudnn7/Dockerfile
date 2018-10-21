ARG repository=vistart/cuda
FROM ${repository}:10.0-runtime-ubuntu16.04
LABEL maintainer "vistart <i@vistart.me>"

EENV CUDNN_VERSION 7.3.1.20
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn7=$CUDNN_VERSION-1+cuda10.0 && \
    apt-mark hold libcudnn7 && \
    rm -rf /var/lib/apt/lists/*

