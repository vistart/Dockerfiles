ARG image_version=8u212-jdk-alpine
FROM openjdk:{$image_version}
LABEL maintainer "vistsart <i@vistart.me>"

ARG bazel_dist_url=https://github.com/bazelbuild/bazel/releases/download/3.1.0/bazel-3.1.0-dist.zip

RUN apk add bash wget unzip
RUN cd /root && wget -qO bazel-dist.zip $bazel_dist_url && mkdir bazel && cd unzip ../bazel-dist.zip
WORKDIR /root/bazel
