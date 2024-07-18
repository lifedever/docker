FROM node:20
MAINTAINER gefangshuai <gefangshuai@163.com>

# 修改时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && mkdir -p /usr/src/app

WORKDIR /usr/src/app