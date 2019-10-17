ARG repository=vistart/cuda
FROM ${repository}:10.0-cudnn7-devel-ubuntu16.04
LABEL maintainer "vistart <i@vistart.me>"

COPY nv-tensorrt-repo-ubuntu1604-cuda10.0-trt6.0.1.5-ga-20190913_1-1_amd64.deb .
RUN dpkg -i nv-tensorrt-repo-ubuntu1604-cuda10.0-trt6.0.1.5-ga-20190913_1-1_amd64.deb && apt-key add /var/nv-tensorrt-repo-cuda10.0-trt6.0.1.5-ga-20190913/7fa2af80.pub && apt-get update && apt-get install tensorrt libnvinfer6 libnvonnxparsers6 libnvparsers6 libnvinfer-plugin6 libnvinfer-dev libnvonnxparsers-dev
 libnvparsers-dev libnvinfer-plugin-dev -y && dpkg -l | grep TensorRT
RUN rm nv-tensorrt-repo-ubuntu1604-cuda10.0-trt6.0.1.5-ga-20190913_1-1_amd64.deb
