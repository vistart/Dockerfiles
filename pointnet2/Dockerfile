FROM vistart/cuda:10.0-cudnn7-devel-ubuntu18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && apt-get upgrade -y && apt-get install python python-pip git vim wget unzip -y
RUN pip install h5py
RUN cd /root && git clone https://github.com/charlesq34/pointnet2
ADD shapenetcore_partanno_segmentation_benchmark_v0_normal.zip /root/pointnet2/data
ADD modelnet40_normal_resampled.zip /root/pointnet2/data
RUN cd /root/pointnet2/data && unzip shapenetcore_partanno_segmentation_benchmark_v0_normal.zip && unzip modelnet40_normal_resampled.zip

