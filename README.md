# Dockerfiles & building scripts for building tensorflow

[Docker Hub](https://hub.docker.com/r/vistart/build_tensorflow)

[![Build Status](https://travis-ci.org/vistart/Dockerfiles.svg?branch=build_tensorflow)](https://travis-ci.org/vistart/Dockerfiles)

# Prerequisites

- Ubuntu, LTS is better.
- Python 3.6 or 3.8, the image containing Python 2.7 remains.
- CUDA 10.0, 10.1, 10.2 or 11.0, and devices that support them.

# Images

The following level headings are also tags for the docker image.

- `py38-cuda11.0`, `py38`

  - CUDA 11.0
  - CUDNN 8.0
  - NCCL 2.7
  - TensorRT 7.1
  - Python 3.8
  - Ubuntu 20.04
  - Not include `python3-libnvinfer` and `uff-converter-tf`

- `py38-cuda10.2`

  - CUDA 10.2
  - CUDNN 7.6
  - NCCL 2.7
  - TensorRT 7.6
  - Python 3.8
  - Ubuntu 20.04
  - Not include `python3-libnvinfer` and `uff-converter-tf`

- `py38-cuda10.1`

  - CUDA 10.1
  - CUDNN 7.6
  - NCCL 2.7
  - TensorRT 6.0
  - Python 3.8
  - Ubuntu 20.04
  - Not include `python3-libnvinfer` and `uff-converter-tf`

- `py38-cuda10.0`, `py38`

  - CUDA 10.0
  - CUDNN 7.6
  - NCCL 2.6
  - TensorRT 7.0
  - Python 3.8
  - Ubuntu 20.04
  - Not include `python3-libnvinfer` and `uff-converter-tf`

- `py36-cuda11.0`

  - CUDA 11.0
  - CUDNN 8.0
  - NCCL 2.7
  - TensorRT 7.1
  - Python 3.6
  - Ubuntu 18.04

- `py36-cuda10.2`

  - CUDA 10.2
  - CUDNN 7.6
  - NCCL 2.7
  - TensorRT 7.0
  - Python 3.6
  - Ubuntu 18.04

- `py36-cuda10.1`

  - CUDA 10.1
  - CUDNN 7.6
  - NCCL 2.7
  - TensorRT 6.0
  - Python 3.6
  - Ubuntu 18.04

- `py36-cuda10.0`, `py36`

  - CUDA 10.0
  - CUDNN 7.6
  - NCCL 2.6
  - TensorRT 7.0
  - Python 3.6
  - Ubuntu 18.04

- `py27-cuda10.1` (no longer updated)

  - CUDA 10.1
  - CUDNN 7.6
  - NCCL 2.5
  - TensorRT 6.0
  - Python 2.7
  - Ubuntu 18.04

- `py27-cuda10.0`, `py27` (no longer updated)

  - CUDA 10.0
  - CUDNN 7.6
  - NCCL 2.5
  - TensorRT 6.0
  - Python 2.7
  - Ubuntu 18.04

To find out the specific version number of each software in the above images, please visit [here](https://hub.docker.com/r/vistart/cuda).

# Usage

- Pull the image you need, for example:

```
docker pull vistart/build_tensorflow:py38-cuda11.0
```
The above command will pull the image that contains Python 3.8 and CUDA 11.0.

- Clone this repository and change directory to it:

```
git clone -b build_tensorflow https://github.com/vistart/Dockerfiles
cd Dockerfiles
```

- Run the build process:

```
sh build_tensorflow/py38-cuda11.0/build_tensorflow_2.sh
```

- Once the build is complete, the build results are generated in the current directory:

```
-rw-r--r-- 1 root    root    262907737 Aug   8 03:43 tensorflow-2.4.0-cp38-cp38-linux_x86_64.whl
```

# Alternative Registry

In addition to storing all images in Docker Hub, they are also stored in the Hong Kong node of Aliyun Container Service for alternative. If you want to use the latest image as soon as possible, but Docker Hub has not been able to synchronize for a long time, you can try to use the Hong Kong node of Aliyun Container Service.

The tag name format is:
```
registry.cn-hongkong.aliyuncs.com/vistart_public/build_tensorflow:<tag name>
```

If you want to use the latest image as soon as possible, but don't want to change it's tag name. You can pull the image stored in the Docker Hub after pulling it stored in the Hong Kong node. Because the contents of the two are exactly the same, they have been tagged after pulling the manifest of the image stored in Docker Hub without pulling any image layer.

After that, if you want to update the image, repeat the above operations.
