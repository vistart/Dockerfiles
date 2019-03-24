FROM pytorch/pytorch:1.0.1-cuda10.0-cudnn7-runtime
LABEL maintainer "vistart <i@vistart.me>"

RUN pip install mmcv cython
RUN apt-get install git -y
ENV CUDA_HOME=/usr/local/cuda-10.0
RUN git clone https://github.com/open-mmlab/mmdetection.git && cd mmdetection && git checkout v0.6rc0 && ./compile.sh && python setup.py install
