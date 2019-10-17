ARG repository=vistart/cuda
FROM ${repository}:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN wget "https://drive.google.com/uc?export=download&id=1xXRKaE8adAAN_6liC-g-5EP9aXbrXj_2" -o nv-tensorrt-repo-ubuntu1804-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb && dpkg -i nv-tensorrt-repo-ubuntu1804-cuda10.1-trt6.0.1.5-ga-20190913_1-1_amd64.deb && apt-key add /var/nv-tensorrt-repo-cuda10.1-trt6.0.1.5-ga-20190913/7fa2af80.pub && apt-get update && apt-get install tensorrt -y && dpkg -l | grep TensorRT
