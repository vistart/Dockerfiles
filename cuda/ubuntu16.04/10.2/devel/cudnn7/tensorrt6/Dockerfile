ARG repository=vistart/cuda
FROM ${repository}:10.2-cudnn7-devel-ubuntu16.04
LABEL maintainer "vistart <i@vistart.me>"

ENV NVINFER_VERSION 6.0.1-1+cuda10.2
RUN apt-get install libnvinfer6=$NVINFER_VERSION \
                    libnvinfer-plugin6=$NVINFER_VERSION \
                    libnvparsers6=$NVINFER_VERSION \
                    libnvonnxparsers6=$NVINFER_VERSION -y
RUN apt-get install 
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvinfer-plugin-dev=$NVINFER_VERSION \
                    libnvparsers-dev=$NVINFER_VERSION \
                    libnvinfer-dev=$NVINFER_VERSION \
                    libnvonnxparsers-dev=$NVINFER_VERSION \
                    
                     -y
RUN apt-get install tensorrt -y && dpkg -l | grep TensorRT
