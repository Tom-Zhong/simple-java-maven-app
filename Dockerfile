FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python、pip 和 curl
RUN apk add --no-cache aws-cli

# 检查安装是否成功
RUN aws --version