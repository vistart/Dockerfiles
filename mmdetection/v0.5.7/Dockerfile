FROM vistart/cuda:10.1-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install python3 python3-pip git libsm6 libxrender1 libfontconfig1 libglib2.0-0 libsm6 libxrender-dev libxext6 -y && apt-get clean && rm -rf /var/lib/apt/lists/*
ARG INSTALLATION_URL=""
RUN pip3 install mmcv cython torch torchvision $INSTALLATION_URL
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/open-mmlab/mmdetection.git && cd mmdetection && git checkout v0.5.7 && ./compile.sh && python3 setup.py install
RUN mkdir data
