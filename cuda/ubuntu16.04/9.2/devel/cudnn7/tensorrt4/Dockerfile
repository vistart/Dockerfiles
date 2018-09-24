ARG repository=vistart/cuda
FROM ${repository}:9.2-cudnn7-devel-1604
LABEL maintainer "vistart <i@vistart.me>"

ENV TENSORRT_VERSION 4.0.1
LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ADD nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb /root
RUN apt-get update && dpkg -i /root/nv-tensorrt-repo-ubuntu1604-cuda9.2-ga-trt4.0.1.6-20180612_1-1_amd64.deb && apt-get update && apt-get install tensorrt -y
RUN apt-get install python3-libnvinfer-doc -y
RUN apt-get install python-libnvinfer-doc -y
RUN apt-get install uff-converter-tf -y
RUN dpkg -l | grep TensorRT

ADD TensorRT-4.0.1.6.Ubuntu-16.04.4.x86_64-gnu.cuda-9.2.cudnn7.1.tar.gz /root
ENV TENSORRT_DIR /root/TensorRT-4.0.1.6
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/root/TensorRT-4.0.1.6/lib
ENV TENSORRT_INC_DIR /root/TensorRT-4.0.1.6/include
ENV TENSORRT_LIB_DIR /root/TensorRT-4.0.1.6/lib