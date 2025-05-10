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
                sh 'aws s3api create-bucket \
    --bucket test-1234-demo-what \
    --region ap-northeast-1 \
    --create-bucket-configuration LocationConstraint=ap-northeast-1'
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
    }
}