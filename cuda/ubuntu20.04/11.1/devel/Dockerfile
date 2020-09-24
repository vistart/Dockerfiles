ARG repository=vistart/cuda
FROM ${repository}:11.1-runtime-ubuntu20.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-libraries-dev-$CUDA_PKG_VERSION \
        cuda-nvml-dev-11-1 \
        cuda-minimal-build-$CUDA_PKG_VERSION \
        cuda-command-line-tools-$CUDA_PKG_VERSION \
        libnccl-dev=$NCCL_VERSION-1+cuda11.1 && \
    rm -rf /var/lib/apt/lists/*

ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
RUN apt-get autoremove -y && apt-get clean

