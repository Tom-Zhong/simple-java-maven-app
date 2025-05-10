FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python、pip 和 curl
RUN apk add --no-cache aws-cli

# 配置 AWS 凭证
WORKDIR /tmp/.aws
COPY ./test1234_accessKeys.csv /tmp/.aws/credentials.csv

# 检查安装是否成功
RUN aws --version

CMD ["aws", "configure", "import --csv file:///tmp/.aws/credentials.csv "]