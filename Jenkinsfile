pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile' // 指定 Dockerfile 文件名
            additionalBuildArgs '--no-cache' // 可选：添加构建参数
        }
    }
    stages {

        stage('AWS CLI Test') {
            steps {
                // 验证 AWS CLI 配置
                sh 'aws configure list'
                // 示例：列出 S3 存储桶
                sh 'aws ec2 describe-instances'
                sh 'aws s3api list-buckets --region ap-northeast-1'
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn --version'
                sh 'mvn -B -DskipTests clean package' 
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Deliver') {

            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }

        // stage('Upload to S3') {
        //     steps {
        //         // 上传构建产物到 S3
        //         sh '''
        //         aws s3 cp ./target s3://test-1234-demo-what/ --recursive --region ap-northeast-1
        //         '''
        //     }
        // }


        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = 'test-1234-demo-what' // 替换为你的 Docker 镜像名称
                    def dockerfilePath = 'Dockerfile' // 替换为你的 Dockerfile 路径
                    def tag = "${BUILD_NUMBER}" // 构建编号作为标签

                    // 构建 Docker 镜像
                    sh "docker build -t ${imageName}:${tag} -f ${dockerfilePath} ."
                }
            }
        }

    }
}