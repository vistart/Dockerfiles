ARG repository=vistart/cuda
FROM ${repository}:9.2-cudnn7-runtime-1604
LABEL maintainer "vistart <i@vistart.me>"

ENV TENSORRT_VERSION 4.0.1
LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ADD nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb /root
RUN apt-get update && dpkg -i /root/nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb && apt-get update && apt-get install tensorrt -y
RUN apt-get install python3-libnvinfer-doc -y
RUN apt-get install python-libnvinfer-doc -y
RUN apt-get install uff-converter-tf -y
RUN dpkg -l | grep TensorRT
