FROM vistart/cuda:11.0-ubuntu20.04
LABEL maintainer "vistart <i@vistart.me>"

WORKDIR /root
RUN git clone https://github.com/ninja-build/ninja
WORKDIR /root/ninja
RUN apt-get update || true && apt-get upgrade -y && apt-get install python3 python3-pip re2c -y && ln -s /usr/bin/python3 /usr/bin/python
RUN ./configure.py --bootstrap
RUN cp ./ninja /usr/bin && ninja -v
# You should prepare the torch, torchvision & torchaudio packages first.
COPY torch-1.7.1+cu110-cp38-cp38-linux_x86_64.whl .
COPY torchvision-0.8.2+cu110-cp38-cp38-linux_x86_64.whl .
COPY torchaudio-0.7.2-cp38-cp38-linux_x86_64.whl .
RUN pip3 install torch-1.7.1+cu110-cp38-cp38-linux_x86_64.whl torchvision-0.8.2+cu110-cp38-cp38-linux_x86_64.whl torchaudio-0.7.2-cp38-cp38-linux_x86_64.whl
RUN pip3 install numpy six scipy numba tqdm h5py plyfile tensorboardX -i https://mirrors.aliyun.com/pypi/simple
RUN git clone https://github.com/mit-han-lab/pvcnn
WORKDIR /root/pvcnn