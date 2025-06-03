FROM amazoncorretto:17-alpine-jdk
MAINTAINER gefangshuai <gefangshuai@163.com>

RUN echo 'http://mirrors.aliyun.com/alpine/v3.6/community/'>/etc/apk/repositories
RUN echo 'http://mirrors.aliyun.com/alpine/v3.6/main/'>>/etc/apk/repositories

#设置字符集
ENV LANG=en_US.UTF-8

RUN apk update && \
    apk add curl busybox tzdata libreoffice&& \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone && \
    apk del tzdata && \
    rm -rf /tmp/* /var/cache/apk/*

RUN apk add --update --no-cache ttf-dejavu fontconfig && rm -rf /var/cache/apk/*

ADD ./libs/msyh.ttc /usr/share/fonts/
ADD ./libs/msyhbd.ttc /usr/share/fonts/
ADD ./libs/msyhl.ttc /usr/share/fonts/
ADD ./libs/simsun.ttc /usr/share/fonts/