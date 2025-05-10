FROM maven:3.9.9-amazoncorretto-17-alpine

# 安装 Python 和 pip
RUN apk add --no-cache python3 py3-pip

RUN python3 -m pip install --user pipx --break-system-packages && \
    python3 -m pipx ensurepath && \
    source ~/.bashrc && \
    pipx install awscli && \
    cat ~/.bashrc && \
    source ~/.bashrc && \
    aws --version
