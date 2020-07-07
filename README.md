[![Build Status](https://travis-ci.org/vistart/Dockerfiles.svg?branch=cuda)](https://travis-ci.org/vistart/Dockerfiles)

# Introduction
All images under this repository are built in strict accordance with the Dockerfiles published by NVIDIA respectively. The only difference between this image and the official version is that the operating system source is from [Tsinghua University](https://mirrors.tuna.tsinghua.edu.cn). These images are updated daily.

# Latest CUDA 11.0 (Experimental)
## Ubuntu 20.04
- 11.0-base-ubuntu20.04 (cuda 11.0.1)
- 11.0-runtime-ubuntu20.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-devel-ubuntu20.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-cudnn8-runtime-ubuntu20.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-devel-ubuntu20.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-tensorrt7-devel-ubuntu20.04, 11.0-ubuntu20.04, latest (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

## Ubuntu 18.04
- 11.0-base-ubuntu18.04 (cuda 11.0.1)
- 11.0-runtime-ubuntu18.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-devel-ubuntu18.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-cudnn8-runtime-ubuntu18.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-devel-ubuntu18.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-tensorrt7-devel-ubuntu18.04, 10.2-ubuntu18.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

## Ubuntu 16.04
- 11.0-base-ubuntu16.04 (cuda 11.0.1)
- 11.0-runtime-ubuntu16.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-devel-ubuntu16.04 (cuda 11.0.1, nccl 2.7.6)
- 11.0-cudnn8-runtime-ubuntu16.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-devel-ubuntu16.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180)
- 11.0-cudnn8-tensorrt7-devel-ubuntu16.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

# CUDA 10.2
## Ubuntu 20.04 (Experimental)
- 10.2-base-ubuntu20.04 (cuda 10.2.89)
- 10.2-runtime-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-runtime-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-devel-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-devel-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn7-tensorrt6-devel-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 6.0.1.8)
- 10.2-cudnn7-tensorrt7-devel-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 7.0.0.11)
- 10.2-cudnn8-runtime-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 8.0.0.180)
- 10.2-cudnn8-devel-ubuntu20.04 (cuda 10.2.89, nccl 2.7.6, cudnn 8.0.0.180)
- 10.2-cudnn8-tensorrt7-devel-ubuntu20.04, 10.2-ubuntu20.04 (cuda 11.0.1, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

## Ubuntu 18.04
- 10.2-base-ubuntu18.04 (cuda 10.2.89)
- 10.2-runtime-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-runtime-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-devel-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-devel-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn7-tensorrt6-devel-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 6.0.1.8)
- 10.2-cudnn7-tensorrt7-devel-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 7.0.0.11)
- 10.2-cudnn8-runtime-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn8-devel-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn8-tensorrt7-devel-ubuntu18.04, 10.2-ubuntu18.04 (cuda 10.2.89, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

## Ubuntu 16.04
- 10.2-base-ubuntu16.04 (cuda 10.2.89)
- 10.2-runtime-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-runtime-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-devel-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6)
- 10.2-cudnn7-devel-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn7-tensorrt6-devel-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 6.0.1.8)
- 10.2-cudnn7-tensorrt7-devel-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 7.0.0.11)
- 10.2-cudnn8-runtime-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn8-devel-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 7.6.5.32)
- 10.2-cudnn8-tensorrt7-devel-ubuntu16.04, 10.2-ubuntu16.04 (cuda 10.2.89, nccl 2.7.6, cudnn 8.0.0.180 tensorrt 7.1.3.4)

# CUDA 10.1
## Ubuntu 20.04 (Experimental)
- 10.1-base-ubuntu20.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu20.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-runtime-ubuntu20.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-devel-ubuntu20.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-devel-ubuntu20.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-cudnn7-tensorrt6-devel-ubuntu20.04, 10.1-ubuntu20.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)

## Ubuntu 18.04
- 10.1-base-ubuntu18.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu18.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-runtime-ubuntu18.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-devel-ubuntu18.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-devel-ubuntu18.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-cudnn7-tensorrt6-devel-ubuntu18.04, 10.1-ubuntu18.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 6.0.1.5)

## Ubuntu 16.04
- 10.1-base-ubuntu16.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu16.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-runtime-ubuntu16.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-devel-ubuntu16.04 (cuda 10.1.243, nccl 2.7.6)
- 10.1-cudnn7-devel-ubuntu16.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32)
- 10.1-cudnn7-tensorrt6-devel-ubuntu16.04, 10.1-ubuntu16.04 (cuda 10.1.243, nccl 2.7.6, cudnn 7.6.5.32 tensorrt 6.0.1.5)

## Ubuntu 14.04
- 10.1-base-ubuntu14.04 (cuda 10.1.243)
- 10.1-runtime-ubuntu14.04 (cuda 10.1.243, nccl 2.6.4)
- 10.1-cudnn7-runtime-ubuntu14.04 (cuda 10.1.243, nccl 2.6.4, cudnn 7.6.5.32)
- 10.1-devel-ubuntu14.04 (cuda 10.1.243, nccl 2.6.4)
- 10.1-cudnn7-devel-ubuntu14.04 (cuda 10.1.243, nccl 2.6.4, cudnn 7.6.5.32)
- 10.1-cudnn7-tensorrt6-devel-ubuntu14.04 (cuda 10.1.243, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 6.0.1.5)

# CUDA 10.0
## Ubuntu 20.04 (Experimental)
- 10.0-base-ubuntu20.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-runtime-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-devel-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-devel-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-cudnn7-tensorrt6-devel-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 6.0.1.8)
- 10.0-cudnn7-tensorrt7-devel-ubuntu20.04, 10.0-ubuntu20.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tednsorrt 7.0.0.11)

## Ubuntu 18.04
- 10.0-base-ubuntu18.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-runtime-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-devel-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-devel-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-cudnn7-tensorrt6-devel-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 6.0.1.5)
- 10.0-cudnn7-tensorrt7-devel-ubuntu18.04, 10.0-ubuntu18.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 7.0.0.11)

## Ubuntu 16.04
- 10.0-base-ubuntu16.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-runtime-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-devel-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-devel-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-cudnn7-tensorrt6-devel-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 6.0.1.5)
- 10.0-cudnn7-tensorrt7-devel-ubuntu16.04, 10.0-ubuntu16.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 7.0.0.11)

## Ubuntu 14.04
- 10.0-base-ubuntu14.04 (cuda 10.0.130)
- 10.0-runtime-ubuntu14.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-runtime-ubuntu14.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-devel-ubuntu14.04 (cuda 10.0.130, nccl 2.6.4)
- 10.0-cudnn7-devel-ubuntu14.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32)
- 10.0-cudnn7-tensorrt6-devel-ubuntu14.04 (cuda 10.0.130, nccl 2.6.4, cudnn 7.6.5.32 tensorrt 6.0.1.5)

# Docker Hub:
[https://hub.docker.com/r/vistart/cuda](https://hub.docker.com/r/vistart/cuda)