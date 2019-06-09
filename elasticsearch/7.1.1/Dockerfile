FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.1
LABEL maintainer "vistart <i@vistart.me>"

ENV VERSION=7.1.1
RUN cd /usr/share/elasticsearch/plugins && mkdir ik && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.1.1/elasticsearch-analysis-ik-7.1.1.zip && unzip elasticsearch-analysis-ik-7.1.1.zip -d /usr/share/elasticsearch/plugins/ik && rm elasticsearch-analysis-ik-7.1.1.zip
# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.1.1/elasticsearch-analysis-ik-7.1.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.1.1/elasticsearch-analysis-pinyin-7.1.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v7.1.1/elasticsearch-analysis-stconvert-7.1.1.zip
