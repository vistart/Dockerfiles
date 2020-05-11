#!/bin/bash

set -euxo pipefail

ARCH=`uname -m`
if [ "$ARCH" == "x86_64" ]; then \
    echo "x86_64" && \
    GOARCH=amd64 \
elif [ "$ARCH" == "armv7l" ]; then \
    echo "armv7l" && \
    GOARCH=arm \
elif [ "$ARCH" == "aarch64" ]; then \
    echo "aarch64" && \
    GOARCH=arm64 \
elif [ "$ARCH" == "ppc64le" ]; then \
    echo "ppc64le" && \
    GOARCH=ppc64le \
fi

VERSION_TAG="$(git rev-parse HEAD)"
VERSION_LINK_FLAG="main.gitCommit=${VERSION_TAG}"

CGO_ENABLED=0 GOOS=linux GOARCH=$GOARCH go build -a -ldflags "-extldflags '-static' -X ${VERSION_LINK_FLAG}" .