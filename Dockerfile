FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python 和 pip
RUN apk add --no-cache python3 py3-pip


RUN pip3 --version

RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip3 install awscli

# 验证安装
RUN aws --version

RUN where aws