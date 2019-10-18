ARG repository=vistart/cuda
FROM ${repository}:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

COPY nv-tensorrt-repo-ubuntu1804-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb .
RUN dpkg -i nv-tensorrt-repo-ubuntu1804-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb && apt-key add /var/nv-tensorrt-repo-cuda10.1-trt6.0.1.5-ga-20190913/7fa2af80.pub && apt-get update && apt-get install tensorrt -y && dpkg -l | grep TensorRT
RUN rm nv-tensorrt-repo-ubuntu1804-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb
