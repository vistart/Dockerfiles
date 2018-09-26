FROM vistart/cuda:10.0-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

ENV DEB_PACKAGES=/root/deb-packages
ENV TRT=nv-tensorrt-repo-ubuntu1804-cuda10.0-trt5.0.0.10-rc-20180906
ENV TRT_DEB=nv-tensorrt-repo-ubuntu1804-cuda10.0-trt5.0.0.10-rc-20180906_1-1_amd64.deb
ENV TRT_VAR_DIR=nv-tensorrt-repo-cuda10.0-trt5.0.0.10-rc-20180906

RUN mkdir $DEB_PACKAGES
ADD $TRT_DEB $DEB_PACKAGES
RUN cd $DEB_PACKAGES && dpkg -i $TRT_DEB
RUN apt-key add /var/$TRT_VAR_DIR/7fa2af80.pub && apt-get update && apt-get install tensorrt -y
RUN dpkg -l | grep TensorRT
