docker
--- 
docker image build by myself


# Build

## open-jdk-8
 
 - 修改了默认时区为`Asia/Shanghai`
 - 添加了必要的中文字体
 - 设置了默认字符集
 - 添加了常用的Linux工具集：`curl`、`busybox`

构建方式：

```bash
docker build -t openjdk-8-alpine .
```