FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python 和 pip
RUN apk add --no-cache python3 py3-pip

# 验证安装
RUN python3 --version && pip3 --version

# 安装CURL
RUN apk add --no-cache curl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
RUN aws --version