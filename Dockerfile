FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python、pip 和 curl
RUN apk add --no-cache python3 py3-pip curl && \
    python3 --version && pip3 --version  && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ls -al && \
    ./aws/install && \
    rm -rf awscliv2.zip aws && \
    aws --version
