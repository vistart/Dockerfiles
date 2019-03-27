FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.0
LABEL maintainer "vistart <i@vistart.me>"

ENV VERSION=6.7.0
RUN cd /usr/share/elasticsearch/plugins && mkdir ik && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.7.0/elasticsearch-analysis-ik-6.7.0.zip && unzip elasticsearch-analysis-ik-6.7.0.zip -d /usr/share/elasticsearch/plugins/ik && rm elasticsearch-analysis-ik-6.7.0.zip
# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.7.0/elasticsearch-analysis-ik-6.7.0.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.7.0/elasticsearch-analysis-pinyin-6.7.0.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v6.7.0/elasticsearch-analysis-stconvert-6.7.0.zip
