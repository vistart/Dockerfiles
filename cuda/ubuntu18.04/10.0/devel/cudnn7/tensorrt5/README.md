# Usage of this Dockerfile

This file cannot be used directly for builds and requires some preparation:

Please visit [this page](https://developer.nvidia.com/nvidia-tensorrt-5x-download) to download 
[TensorRT 5.0.0.10 RC for Ubuntu 1804 and CUDA 10.0 DEB local repo packages](https://developer.nvidia.com/compute/machine-learning/tensorrt/5.0/rc/nv-tensorrt-repo-ubuntu1804-cuda10.0-trt5.0.0.10-rc-20180906_1-1_amd64), and place it in the current directory.

Note: You need to sign up for an NVIDIA account and log in before downloading, and then do a survey.

This Dockerfile does not have python-libnvinfer[-dev], uff-converter-tf installed, you need to install the correct version according to your actual running environment.
