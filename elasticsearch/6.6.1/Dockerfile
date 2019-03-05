FROM docker.elastic.co/elasticsearch/elasticsearch:6.6.1
LABEL maintainer "vistart <i@vistart.me>"

ENV VERSION=6.6.1
RUN cd /usr/share/elasticsearch/plugins && mkdir ik && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.6.1/elasticsearch-analysis-ik-6.6.1.zip && unzip elasticsearch-analysis-ik-6.6.1.zip -d /usr/share/elasticsearch/plugins/ik && rm elasticsearch-analysis-ik-6.6.1.zip
# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.6.1/elasticsearch-analysis-ik-6.6.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.6.1/elasticsearch-analysis-pinyin-6.6.1.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v6.6.1/elasticsearch-analysis-stconvert-6.6.1.zip
