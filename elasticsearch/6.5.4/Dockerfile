FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
LABEL maintainer "vistart <i@vistart.me>"

ENV VERSION=6.5.4
RUN cd /usr/share/elasticsearch/plugins && mkdir ik && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.4/elasticsearch-analysis-ik-6.5.4.zip && unzip elasticsearch-analysis-ik-6.5.4.zip -d /usr/share/elasticsearch/plugins/ik && rm elasticsearch-analysis-ik-6.5.4.zip
# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.4/elasticsearch-analysis-ik-6.5.4.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.5.4/elasticsearch-analysis-pinyin-6.5.4.zip
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-stconvert/releases/download/v6.5.4/elasticsearch-analysis-stconvert-6.5.4.zip
