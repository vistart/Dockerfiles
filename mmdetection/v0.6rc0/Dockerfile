FROM vistart/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install python3 git -y
RUN pip install mmcv cython
RUN git clone https://github.com/open-mmlab/mmdetection.git && cd mmdetection && git checkout v0.6rc0 && ./compile.sh && python setup.py install
