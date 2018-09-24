ARG repository=vistart/nsnam
ARG ns3_version
FROM ${repository}:ns-3.29
LABEL maintainer "vistart <i@vistart.me>"

RUN cd /root/workspace && \
    wget https://telematics.poliba.it/files/tools/nano/nanonetworks.tar --no-check-certificate && \
    tar -xf nanonetworks.tar && \
    cd /root/workspace/ns-allinone-3.29/ns-3.29/src && \
    cp -r /root/workspace/nanonetworks . && \
    cd /root/workspace/ns-allinone-3.29/ns-3.29 && \
    ./waf configure && \
    ./waf
