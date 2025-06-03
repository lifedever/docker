# 使用 Ubuntu noble (24.04 LTS) 基础镜像
FROM ubuntu:noble

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装必要的工具和依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libreoffice \
    wget \
    gnupg \
    software-properties-common \
    fontconfig \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# 添加 Amazon Corretto 仓库
RUN wget -O- https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto.gpg] https://apt.corretto.aws stable main" > /etc/apt/sources.list.d/corretto.list

# 安装 Amazon Corretto JDK 24
RUN apt-get update && \
    apt-get install -y java-24-amazon-corretto-jdk && \
    rm -rf /var/lib/apt/lists/*

# 创建字体目录
RUN mkdir -p /usr/share/fonts/custom

# 复制本地 fonts 文件夹中的字体文件到镜像
COPY fonts/*.ttc /usr/share/fonts/custom/

# 设置字体权限并更新字体缓存
RUN chmod 644 /usr/share/fonts/custom/*.ttc && \
    fc-cache -fv

# 清理缓存和临时文件
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 验证安装
RUN java -version && \
    fc-list | grep -i "custom"

# 设置工作目录
WORKDIR /app

# 设置时区（可选）
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 设置环境变量
ENV JAVA_HOME=/usr/lib/jvm/java-24-amazon-corretto
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# 其他配置...