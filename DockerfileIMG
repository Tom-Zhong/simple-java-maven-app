# 使用官方 OpenJDK 运行时镜像
FROM azul/zulu-openjdk:17-latest

# 设置工作目录
WORKDIR /app

# 将 JAR 包复制到镜像中
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# 暴露应用运行的端口（根据你的应用配置）
EXPOSE 8080

# 启动 JAR 包
ENTRYPOINT ["java", "-jar", "app.jar"]