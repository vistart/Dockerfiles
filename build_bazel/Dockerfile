ARG image_version=20.04
FROM vistart:${image_version}
LABEL maintainer "vistsart <i@vistart.me>"

ARG bazel_dist_url=https://github.com/bazelbuild/bazel/releases/download/3.1.0/bazel-3.1.0-dist.zip

RUN apt-get update && apt-get upgrade -y && apt install -y build-essential openjdk-8-jdk python wget unzip
RUN cd /root && wget -qO bazel-dist.zip $bazel_dist_url && mkdir bazel && cd bazel && unzip ../bazel-dist.zip
WORKDIR /root/bazel
