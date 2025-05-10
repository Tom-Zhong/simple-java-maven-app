FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python 和 pip
RUN apk add --no-cache python3 py3-pip

# 安装 AWS CLI
RUN pip3 install awscli

# 验证安装
RUN aws --version