# Dockerfiles

[![Build Status](https://img.shields.io/github/workflow/status/vistart/Dockerfiles/ubuntu%20-%20Build%20and%20Deploy%20to%20Docker%20Hub%20and%20Aliyun%20Container%20Registry/ubuntu)](https://travis-ci.com/vistart/Dockerfiles)

Unlike the official ubuntu, this image first installs the package related to the CA certificate and changes the software source to [Tsinghua University](https://mirrors.tuna.tsinghua.edu.cn).

This image supports multiple platforms. For details, please refer to the following description.

## Ubuntu 14.04

### Tags

- `14.04`, `trusty`

### Platforms

- `linux/amd64`
- `linux/arm64`
- `linux/ppc64le`
- `linux/386`
- `linux/arm/v7`

## Ubuntu 16.04

### Tags

- `16.04`, `xenial`

### Platforms

- `linux/amd64`
- `linux/arm64`
- `linux/ppc64le`
- `linux/386`
- `linux/arm/v7`


## Ubuntu 18.04

### Tags

- `18.04`, `bionic`

### Platforms

- `linux/amd64`
- `linux/arm64`
- `linux/ppc64le`
- `linux/386`
- `linux/arm/v7`


## Ubuntu 20.04

### Tags

- `20.04`, `focal`

### Platforms

- `linux/amd64`
- `linux/arm64`
- `linux/s390x`
- `linux/arm/v7`


## Ubuntu 22.04

### Tags

- `22.04`, `jammy`, `latest`

### Platforms

- `linux/amd64`
- `linux/arm64`
- `linux/s390x`
- `linux/arm/v7`

## Aliyun Container Registry

In addition to the image pushed to the docker hub, the same image is also pushed to the following container registry. You can replace the image name with one of the subordinates, and keep the tag unchanged, you can use the same image as the version managed in the docker hub.

- `registry.cn-hongkong.aliyuncs.com/vistart_public/ubuntu:<tag>`
- `registry.eu-central-1.aliyuncs.com/vistart_public/ubuntu:<tag>`
- `registry.ap-southeast-2.aliyuncs.com/vistart_public/ubuntu:<tag>`
- `registry.me-east-1.aliyuncs.com/vistart_public/ubuntu:<tag>`
