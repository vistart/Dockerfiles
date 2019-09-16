FROM vistart/cuda:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install python3 python3-pip git libsm6 libxrender1 libfontconfig1 -y
RUN pip3 install mmcv cython torch torchvision
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/open-mmlab/mmdetection.git && cd mmdetection && git checkout v1.0rc0 && ./compile.sh && python3 setup.py install
RUN mkdir data
