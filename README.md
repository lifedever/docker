docker

---

docker image build by myself

# open-jdk-8

- 修改了默认时区为`Asia/Shanghai`
- 添加了必要的中文字体
- 设置了默认字符集
- 添加了常用的 Linux 工具集：`curl`、`busybox`

构建方式：

```bash
docker build -t openjdk-8 . --platform=linux/amd64
```

# nginx

- 修改了默认时区为`Asia/Shanghai`
- 设置了默认字符集
- 添加了常用的 Linux 工具集：`curl`、`busybox`

构建方式：

```bash
docker build -t nginx . --platform=linux/amd64
```

# file-online-preview-server

构建方式：
```bash
docker build -t file-online-preview-server . --platform=linux/amd64
```

# node

构建方式：
```bash
docker build -t node . --platform=linux/amd64
```

# node-18-ubuntu-22_04
构建方式：
```bash
docker build -t node-18-ubuntu-22_04 . --platform=linux/amd64
```