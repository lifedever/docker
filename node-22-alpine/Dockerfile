FROM node:22-alpine
MAINTAINER gefangshuai <gefangshuai@163.com>

# 修改时区（Alpine 需要 tzdata）
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    mkdir -p /usr/src/app

# 预装 certd 运行时需要的依赖（openssl、openjdk8、wget、lego 下载会用到）
RUN apk add --no-cache openssl openjdk8 wget

WORKDIR /usr/src/app
