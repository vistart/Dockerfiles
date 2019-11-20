ARG repository=vistart/cuda
FROM ${repository}:10.1-cudnn7-devel-ubuntu14.04
LABEL maintainer "vistart <i@vistart.me>"

COPY nv-tensorrt-repo-ubuntu1604-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb .
RUN dpkg -i nv-tensorrt-repo-ubuntu1604-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb && apt-key add /var/nv-tensorrt-repo-cuda10.1-trt6.0.1.5-ga-20190913/7fa2af80.pub && apt-get update
ENV NVINFER_VERSION 6.0.1-1+cuda10.1
RUN apt-get install libnvinfer6=$NVINFER_VERSION \
                    libnvinfer-plugin6=$NVINFER_VERSION \
                    libnvparsers6=$NVINFER_VERSION \
                    libnvonnxparsers6=$NVINFER_VERSION -y
RUN apt-get install libnvinfer-bin=$NVINFER_VERSION \
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvinfer-plugin-dev=$NVINFER_VERSION \
                    libnvparsers-dev=$NVINFER_VERSION \
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvonnxparsers-dev=$NVINFER_VERSION \
                    libnvinfer-samples=$NVINFER_VERSION \
                    libnvinfer-doc=$NVINFER_VERSION -y
RUN apt-get install tensorrt -y && dpkg -l | grep TensorRT
RUN rm nv-tensorrt-repo-ubuntu1604-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb
