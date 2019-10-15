[![Build Status](https://travis-ci.org/vistart/Dockerfiles.svg?branch=cuda)](https://travis-ci.org/vistart/Dockerfiles)

# Introduction
All images under this repository are built in strict accordance with the Dockerfiles published by NVIDIA respectively. The only difference between this image and the official version is that the operating system source is from [Shanghai Jiaotong University](https://ftp.sjtu.edu.cn). I will make a new image soon after NVIDIA releases a new version of the software.

# Latest CUDA 10.1
## Ubuntu 18.04
- 10.1-base-ubuntu18.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu18.04 (cuda 10.1.243, nccl 2.4.8)
- 10.1-cudnn7-runtime-ubuntu18.04 (cuda 10.1.243, nccl 2.4.8, cudnn 7.6.4.38)
- 10.1-devel-ubuntu18.04 (cuda 10.1.243, nccl 2.4.8)
- 10.1-cudnn7-devel-ubuntu18.04 (cuda 10.1.243, nccl 2.4.8, cudnn 7.6.4.38)

## Ubuntu 16.04
- 10.1-base-ubuntu16.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu16.04 (cuda 10.1.243, nccl 2.4.8)
- 10.1-cudnn7-runtime-ubuntu16.04 (cuda 10.1.243, nccl 2.4.8, cudnn 7.6.4.38)
- 10.1-devel-ubuntu16.04 (cuda 10.1.243, nccl 2.4.8)
- 10.1-cudnn7-devel-ubuntu16.04 (cuda 10.1.243, nccl 2.4.8, cudnn 7.6.4.38)

# CUDA 10.0
## Ubuntu 18.04
- 10.0-base-ubuntu18.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu18.04 (cuda 10.0.130, nccl 2.4.8)
- 10.0-cudnn7-runtime-ubuntu18.04 (cuda 10.0.130, nccl 2.4.8, cudnn 7.6.4.38)
- 10.0-devel-ubuntu18.04 (cuda 10.0.130, nccl 2.4.8)
- 10.0-cudnn7-devel-ubuntu18.04 (cuda 10.0.130, nccl 2.4.8, cudnn 7.6.4.38)

## Ubuntu 16.04
- 10.0-base-ubuntu16.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu16.04 (cuda 10.0.130, nccl 2.4.8)
- 10.0-cudnn7-runtime-ubuntu16.04 (cuda 10.0.130, nccl 2.4.8, cudnn 7.6.4.38)
- 10.0-devel-ubuntu16.04 (cuda 10.0.130, nccl 2.4.8)
- 10.0-cudnn7-devel-ubuntu16.04 (cuda 10.0.130, nccl 2.4.8, cudnn 7.6.4.38)

# CUDA 9.2
## Ubuntu 18.04
- 9.2-base-ubuntu18.04 (cuda 9.2.148)
- 9.2-runtime-ubuntu18.04 (cuda 9.2.148, nccl 2.4.8)
- 9.2-cudnn7-runtime-ubuntu18.04 (cuda 9.2.148, nccl 2.4.8, cudnn 7.6.3.30)
- 9.2-devel-ubuntu18.04 (cuda 9.2.148, nccl 2.4.8)
- 9.2-cudnn7-devel-ubuntu18.04 (cuda 9.2.148, nccl 2.4.8, cudnn 7.6.3.30)

## Ubuntu 16.04
- 9.2-base-ubuntu16.04 (cuda 9.2.148)
- 9.2-runtime-ubuntu16.04 (cuda 9.2.148, nccl 2.4.8)
- 9.2-cudnn7-runtime-ubuntu16.04 (cuda 9.2.148, nccl 2.4.8, cudnn 7.6.3.30)
- 9.2-devel-ubuntu16.04 (cuda 9.2.148, nccl 2.4.8)
- 9.2-cudnn7-devel-ubuntu16.04 (cuda 9.2.148, nccl 2.4.8, cudnn 7.6.3.30)

NVIDIA has not yet released the Dockerfile for TensorRT. I will make it after NVIDIA is released.

# Docker Hub:
[https://hub.docker.com/r/vistart/cuda](https://hub.docker.com/r/vistart/cuda)