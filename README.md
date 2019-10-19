# Dockerfiles & building scripts for building tensorflow

[Docker Hub](https://hub.docker.com/r/vistart/build_tensorflow)

[![Build Status](https://travis-ci.org/vistart/Dockerfiles.svg?branch=build_tensorflow)](https://travis-ci.org/vistart/Dockerfiles)

# Prerequisites

- Ubuntu, LTS is better
- Python 2.7 or 3.6
- CUDA 10.0 or 10.1, and devices that support them

# Images

The following level headings are also tags for the docker image.

- `py36-cuda10.1`

  - CUDA 10.1
  - CUDNN 7.6
  - NCCL 2.4
  - TensorRT 6.0
  - Python 3.6
  - Ubuntu 18.04

- `py36-cuda10.0`, `py36`

  - CUDA 10.0
  - CUDNN 7.6
  - NCCL 2.4
  - TensorRT 6.0
  - Python 3.6
  - Ubuntu 18.04

- `py27-cuda10.1`

  - CUDA 10.1
  - CUDNN 7.6
  - NCCL 2.4
  - TensorRT 6.0
  - Python 2.7
  - Ubuntu 18.04

- `py27-cuda10.0`, `py27`

  - CUDA 10.0
  - CUDNN 7.6
  - NCCL 2.4
  - TensorRT 6.0
  - Python 2.7
  - Ubuntu 18.04

To find out the specific version number of each software in the above images, please visit [here](https://hub.docker.com/r/vistart/cuda).

# Usage

- Pull the image you need, for example:

```
docker pull vistart/build_tensorflow:py36-cuda10.1
```
The above command will pull the image that contains Python 3.6 and CUDA 10.1.

- Clone this repository and change directory to it:

```
git clone -b build_tensorflow https://github.com/vistart/Dockerfiles
cd Dockerfiles
```

- Run the build process:

```
sh build_tensorflow/py36-cuda10.1/build_tensorflow_2.sh
```

- Once the build is complete, the build results are generated in the current directory:

```
-rwxrwxrwx 1 vistart vistart 194526324 Oct 19 18:59 tensorflow-2.0.0-cp36-cp36m-linux_x86_64.whl*
```
