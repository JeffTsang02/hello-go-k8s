# hello-go-k8s

这是一个用于展示基本 Kubernetes 部署流程的项目，包含：

- 使用 Go 编写的简单 Web 服务器
- 使用 Docker 构建的容器镜像
- 使用 K3s 本地集群进行部署
- 通过 NodePort 暴露服务供浏览器访问

## 📂 项目结构

```
.
├── Dockerfile           # 构建 Go Web 服务器镜像
├── .dockerignore        # 忽略无关文件
├── hello-go.yaml        # Kubernetes Deployment 和 Service 配置
├── main.go              # Web 服务器代码，访问 / 返回 "Hello world!"
├── go.mod               # go相关配置文件
```

## 🚀 启动步骤

### 1. 构建镜像

```bash
docker build -t hello-go-server .
```

### 2. 将镜像导入 K3s（containerd）

```bash
docker save hello-go-server:latest -o hello-go-server.tar
ctr images import hello-go-server.tar
```

### 3. 部署到 K3s

```bash
kubectl apply -f hello-go.yaml
```

### 4. 访问服务

在浏览器打开：

```
http://<你的主机IP>:30001
```

应看到：

```
Hello world!
```
