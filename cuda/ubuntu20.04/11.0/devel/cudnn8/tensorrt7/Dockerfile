ARG repository=vistart/cuda
FROM ${repository}:11.0-cudnn8-devel-ubuntu20.04
LABEL maintainer "vistart <i@vistart.me>"

ARG TRT_NAME=cuda11.0-trt7.2.1.6-ga-20201007
COPY nv-tensorrt-repo-ubuntu1804-${TRT_NAME}_1-1_amd64.deb .
RUN dpkg -i nv-tensorrt-repo-ubuntu1804-${TRT_NAME}_1-1_amd64.deb && apt-key add /var/nv-tensorrt-repo-${TRT_NAME}/7fa2af80.pub && apt-get update
ARG NVINFER_VERSION=7.2.1-1+cuda11.0
RUN apt-get install libnvinfer7=$NVINFER_VERSION \
                    libnvinfer-plugin7=$NVINFER_VERSION \
                    libnvparsers7=$NVINFER_VERSION \
                    libnvonnxparsers7=$NVINFER_VERSION -y
RUN apt-get install libnvinfer-bin=$NVINFER_VERSION \
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvinfer-plugin-dev=$NVINFER_VERSION \
                    libnvparsers-dev=$NVINFER_VERSION \
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvonnxparsers-dev=$NVINFER_VERSION \
                    libnvinfer-samples=$NVINFER_VERSION \
                    libnvinfer-doc=$NVINFER_VERSION -y
RUN apt-get install tensorrt -y && dpkg -l | grep TensorRT
RUN rm nv-tensorrt-repo-ubuntu1804-${TRT_NAME}_1-1_amd64.deb
