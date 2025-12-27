# 使用 Ubuntu noble (24.04 LTS) 基础镜像
FROM ubuntu:24.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 替换为阿里云镜像源
RUN sed -i 's|http://archive.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's|http://security.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list.d/ubuntu.sources

# 安装必要的工具和依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    software-properties-common \
    fontconfig \
    ca-certificates \
    locales \
    curl && \
    rm -rf /var/lib/apt/lists/*

# 添加 Amazon Corretto 仓库
RUN wget -O- https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto.gpg] https://apt.corretto.aws stable main" > /etc/apt/sources.list.d/corretto.list

# 安装 Amazon Corretto JDK 21
RUN apt-get update && \
    apt-get install -y java-21-amazon-corretto-jdk && \
    rm -rf /var/lib/apt/lists/*

# ============================================
# 安装 Playwright 运行所需的系统依赖
# Ubuntu 24.04 没有非 Snap 版的 chromium 包
# 让 Playwright Java 自动下载并使用内置浏览器
# ============================================
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Chromium/Playwright 运行依赖
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libxkbcommon0 \
    libatspi2.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libasound2t64 \
    # 字体
    fonts-freefont-ttf \
    fonts-noto-cjk \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# 创建字体目录
RUN mkdir -p /usr/share/fonts/custom

# 复制本地 fonts 文件夹中的字体文件到镜像
COPY fonts/*.ttc /usr/share/fonts/custom/
COPY fonts/*.ttf /usr/share/fonts/custom/

# 设置字体权限并更新字体缓存
RUN chmod 644 /usr/share/fonts/custom/* && \
    fc-cache -fv

# 配置中文字符集
RUN locale-gen zh_CN.UTF-8 && \
    update-locale LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8
ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN:zh
ENV LC_ALL=zh_CN.UTF-8

# 设置时区为上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 清理缓存和临时文件
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 验证安装
RUN java -version && \
    fc-list | grep -i "custom" && \
    locale && \
    date

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Playwright 环境变量（使用 Playwright 标准目录）
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# ============================================
# 预安装 Playwright Chromium
# 使用 npx playwright 安装浏览器到标准目录
# ============================================
RUN apt-get update && \
    apt-get install -y --no-install-recommends nodejs npm && \
    npx playwright install chromium && \
    # 清理 Node.js（可选，如果不需要保留）
    apt-get purge -y nodejs npm && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /root/.npm /root/.cache && \
    # 验证安装并列出浏览器文件
    ls -la /ms-playwright/
