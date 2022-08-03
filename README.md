<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn chartmuseum 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/chartmuseum/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/chartmuseum/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/chartmuseum?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/chartmuseum?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/chartmuseum-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/install-chartmuseum-138.html) 一键安装 **chartmuseum**
- [Dockerfile 源码](https://github.com/quicklyon/chartmuseum-docker)
- [chartmuseum 源码](https://github.com/helm/chartmuseum)
- [chartmuseum 官网](https://chartmuseum.com)

## 一、关于 chartmuseum

[ChartMuseum](https://chartmuseum.com/)是一款用Golang编写的开源Helm Chart Repository托管服务，并且支持多种后端云存储。

chartmuseum官网：[https://chartmuseum.com](https://chartmuseum.com)

<!-- 这里写应用的【附加信息】 -->

<!-- 示例

### 1.1 特性

- 批量执行: 主机命令在线批量执行
- 在线终端: 主机支持浏览器在线终端登录
- 文件管理: 主机文件在线上传下载
- 任务计划: 灵活的在线任务计划
- 发布部署: 支持自定义发布部署流程
- 配置中心: 支持 KV、文本、json 等格式的配置
- 监控中心: 支持站点、端口、进程、自定义等监控
- 报警中心: 支持短信、邮件、钉钉、微信等报警方式
- 优雅美观: 基于 Ant Design 的 UI 界面
- 开源免费: 前后端代码完全开源

-->

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/chartmuseum/tags/)

## 三、获取镜像

* [`latest`, `0.15.0`](https://github.com/quicklyon/chartmuseum-docker/blob/0.15.0/Dockerfile)

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/chartmuseum) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/chartmuseum:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/chartmuseum/tags/)

```bash
docker pull easysoft/chartmuseum:[TAG]
```

## 四、持久化数据

如果你删除容器，所有的数据都将被删除，下次运行镜像时会重新初始化数据。为了避免数据丢失，你应该为容器提供一个挂在卷，这样可以将数据进行持久化存储。

为了数据持久化，你应该挂载持久化目录：

- /data 持久化数据

如果挂载的目录为空，首次启动会自动初始化相关文件

```bash
$ docker run -it \
    -v $PWD/data:/data \
docker pull easysoft/chartmuseum:latest
```

或者修改 docker-compose.yml 文件，添加持久化目录配置

```bash
services:
  chartmuseum:
  ...
    volumes:
      - /path/to/persistence:/data
  ...
```

## 五、环境变量

| 变量名           | 默认值        | 说明                             |
| ---------------- | ------------- | -------------------------------- |
| EASYSOFT_DEBUG   | false         | 是否打开调试信息，默认关闭       |
| PORT       | 8080          | 监听端口 端口                       |
| STORAGE         | local          | 存储类型                 |
| STORAGE_LOCAL_ROOTDIR       | /data          | 本地存储路径                     |
| AUTH_ANONYMOUS_GET   | true     | 允许匿名pull                       |
| BASIC_AUTH_PASS       | admin     | Auth用户 |
| BASIC_AUTH_USER       | quickon-admin          | Auth密码 |

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f chartmuseum

```


**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:8080` 访问
- 默认用户名：`admin`，默认密码：`quickon-admin`
- [VERSION](https://github.com/quicklyon/chartmuseum-docker/blob/main/VERSION) 文件中详细的定义了Makefile可以操作的版本
- [docker-compose.yml](https://github.com/quicklyon/chartmuseum-docker/blob/main/docker-compose.yml)
