# node-22-alpine

在上游 `node:22-alpine` 基础上：
- 设置时区 `Asia/Shanghai`
- 预装 certd 运行时所需：`openssl`、`openjdk8`、`wget`

## 构建并推送（x86/amd64）

目标机器是 x86/amd64（阿里云 ECS），必须指定平台构建。

```bash
# 本机（Mac M1/M2）需要显式指定平台
docker build --platform=linux/amd64 -t node-22-alpine .

# 登录阿里云 ACR
docker login --username=gefangshuai@manyibar registry.cn-hangzhou.aliyuncs.com

# 打 tag + push
docker tag node-22-alpine registry.cn-hangzhou.aliyuncs.com/noyi/node:22-alpine
docker push registry.cn-hangzhou.aliyuncs.com/noyi/node:22-alpine
```

## 使用

在业务 Dockerfile 里：

```dockerfile
FROM registry.cn-hangzhou.aliyuncs.com/noyi/node:22-alpine
```
