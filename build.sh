#!/bin/bash

con=$(buildah from docker.io/openjdk:8)
buildah run $con mkdir /app
buildah copy $con ./data-integration entrypoint.sh /app

TZ=Asia/Shanghai
buildah config --env TZ=$TZ $con
buildah run $con echo 设置默认时区 $TZ
buildah run $con echo $TZ > /etc/timezone
buildah run $con ln -sf /usr/share/zoneinfo/$TZ /etc/localtime

buildah config --entrypoint ["/app/entrypoint.sh"]
buildah config --cmd ["/app/ccarte.sh", "0.0.0.0", "8080"]

buildah commit -t $con docker.io/chenxizhan1995/kettle:9.1
