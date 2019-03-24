FROM pytorch/pytorch:1.0.1-cuda10.0-cudnn7-runtime
LABEL maintainer "vistart <i@vistart.me>"

RUN pip install mmcv
RUN apt-get install git -y
RUN git clone https://github.com/open-mmlab/mmdetection.git
RUN cd mmdetection && pip install cython && ./compile.sh && pip install .
