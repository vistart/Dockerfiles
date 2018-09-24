ARG repository=vistart/nsnam
ARG ns3_version
FROM ${repository}:ns-3.28
LABEL maintainer "vistart <i@vistart.me>"

RUN cd /root/workspace && \
    wget https://telematics.poliba.it/files/tools/nano/nanonetworks.tar --no-check-certificate && \
    tar -xf nanonetworks.tar && \
    cd /root/workspace/ns-allinone-3.28/ns-3.28/src && \
    cp -r /root/workspace/nanonetworks . && \
    cd /root/workspace/ns-allinone-3.28/ns-3.28 && \
    ./waf configure && \
    ./waf
