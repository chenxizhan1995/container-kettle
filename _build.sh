#!/bin/bash

echo 设置默认时区 $TZ
echo $TZ > /etc/timezone
ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
