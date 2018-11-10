FROM vistart/ubuntu:18.04
LABEL maintainer "vistart <i@vistart.me>"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install git \
                    cmake \
                    libeigen3-dev \
                    libflann-dev \
                    libboost-iostreams-dev \
                    libboost-date-time-dev \
                    libboost-filesystem-dev \
                    libboost-thread-dev \
                    libboost-system-dev \
                    libusb-dev -y
RUN export DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apt-get install tzdata -y && dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install libvtk7-dev -y
RUN cd root && git clone https://github.com/PointCloudLibrary/pcl && cd pcl && git checkout pcl-1.9.0
RUN cd /root/pcl && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j$(nproc) && make -j$(nproc) install
