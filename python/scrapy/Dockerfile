ARG pythonversion=latest
FROM python:${pythonversion}
LABEL maintainer "vistart <i@vistart.me>"

RUN pip install Scrapy selenium scrapy-selenium mycli
ARG CHROMEDRIVERURL=http://npm.taobao.org/mirrors/chromedriver/83.0.4103.14/chromedriver_linux64.zip
RUN wget -qO chromedriver.zip $CHROMEDRIVERURL && unzip chromedriver.zip -d /usr/local/bin