FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python、pip 和 curl
RUN apk add --no-cache python3 py3-pip curl && \
    python3 --version && pip3 --version  && \
    cd /tmp && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ls -al && \
    cd /tmp/.aws && \
    ./install -bin-dir /usr/local/bin --install-dir /usr/local/aws-cli && \
    aws --version
