FROM ubuntu:22.04
MAINTAINER gefangshuai <gefangshuai@163.com>


RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

RUN apt-get install -y libgtk2.0-0
RUN apt-get install -y libsm6
RUN apt-get install -y libnss3-dev
RUN apt-get install -y libatk-bridge2.0-0
RUN apt-get install -y libdrm-dev
RUN apt-get install -y libxkbcommon-x11-0
RUN apt-get install -y libgbm-dev
RUN apt-get install -y libasound2
RUN apt-get install -y language-pack-zh-hans

# Install Node.js
RUN apt-get install -y curl
RUN curl --silent --location https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
# RUN apt-get install -y build-essential

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
# 修改时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && mkdir -p /usr/src/app

ADD ./libs/* /usr/share/fonts/

WORKDIR /usr/src/app