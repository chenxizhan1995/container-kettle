# 构建Kettle镜像

## 关于 pdi 安装包
kettle 安装包接近 2GB，手动从网上下载。
当前（2021-10-24）最新版kettle为 9.2，我使用 9.1 版，下载路劲为
[SourceForge.net](https://sourceforge.net/projects/pentaho/files/Pentaho 9.1/client-tools/)
选择名为 pdi-ce-9.1.0.0-324.zip 的文件下载。
下载完成后解压在当前目录下 下，`./data-integration`
解压完成后 carte.sh 的路径为：`./data-integration/carte.sh`

默认监听 8080 端口，slave 模式。
## 构建
```bash
buildah bud -t docker.io/chenxizhan1995/kettle:9.1 .

podman rm -f kettle
podman run --name kettle -dit -p 8080:8080/tcp docker.io/chenxizhan1995/kettle:9.1

podman run --rm -it -p 8080:8080/tcp docker.io/chenxizhan1995/kettle:9.1 bash
```
