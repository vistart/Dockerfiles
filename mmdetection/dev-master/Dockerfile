FROM vistart/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install python3 python3-pip git -y
RUN pip install mmcv cython https://download.pytorch.org/whl/cu100/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl torchvision
RUN git clone https://github.com/open-mmlab/mmdetection.git && cd mmdetection && ./compile.sh && python setup.py install
