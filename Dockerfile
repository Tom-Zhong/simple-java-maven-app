FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python、pip 和 curl
RUN apk add --no-cache aws-cli

# 配置 AWS 凭证
RUN mkdir -p ~/.aws && \
    echo "[default]" > ~/.aws/credentials && \
    echo "aws_access_key_id=AKIAWIPGR2FFCTDUHEUB" >> ~/.aws/credentials && \
    echo "aws_secret_access_key=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" >> ~/.aws/credentials && \
    echo "[default]" > ~/.aws/config && \
    echo "region=ap-northeast-1" >> ~/.aws/config

# 检查安装是否成功
RUN aws --version