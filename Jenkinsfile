pipeline {
    agent any
    stages {
        stage('Build') { 
            agent {
                dockerfile {
                    filename 'Dockerfile' // 指定 Dockerfile 文件名
                    additionalBuildArgs '--no-cache' // 可选：添加构建参数
                }
            }
            steps {
                sh 'mvn --version'
                sh 'mvn -B -DskipTests clean package' 
            }
        }

        stage('Test') {
            agent {
                dockerfile {
                    filename 'Dockerfile' // 指定 Dockerfile 文件名
                    additionalBuildArgs '--no-cache' // 可选：添加构建参数
                }
            }
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
            agent {
                dockerfile {
                    filename 'Dockerfile' // 指定 Dockerfile 文件名
                    additionalBuildArgs '--no-cache' // 可选：添加构建参数
                }
            }
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }

        stage('Deploy') {
            agent {
                docker {
                    image 'amazon/aws-cli' // 使用 AWS CLI 镜像
                }
            }
            steps {
                sh 'aws --version'
            }
        }
    }
}