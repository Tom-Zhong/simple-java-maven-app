pipeline {
    agent any
    stages {
        // stage('AWS CLI Test') {
        //     agent {
        //         dockerfile {
        //             filename 'Dockerfile' // 指定 Dockerfile 文件名
        //         }
        //     }
        //     steps {
        //         // 验证 AWS CLI 配置
        //         sh 'aws configure list'
        //         // 示例：列出 S3 存储桶
        //         sh 'aws ec2 describe-instances'
        //         sh 'aws s3api list-buckets --region ap-northeast-1'
        //     }
        // }
        stage('Build') { 
            agent {
                dockerfile {
                    filename 'Dockerfile' // 指定 Dockerfile 文件名
                }
            }
            steps {
                sh 'mvn --version'
                sh 'mvn -B -DskipTests clean package'
                stash name: 'build-artifacts', includes: 'target/**/*'
            }
        }

        stage('Build Docker Image') {
            agent any
            steps {
                unstash 'build-artifacts'
                sh 'docker build -t myapp:latest -f DockerfileIMG .'
                sh 'docker images'
            }
        }

        // stage('Test') {
        //     agent {
        //         dockerfile {
        //             filename 'Dockerfile' // 指定 Dockerfile 文件名
        //         }
        //     }
        //     steps {
        //         sh 'mvn test'
        //     }
        //     post {
        //         always {
        //             junit 'target/surefire-reports/*.xml'
        //         }
        //     }
        // }

        // stage('Deliver') {
        //     agent {
        //         dockerfile {
        //             filename 'Dockerfile' // 指定 Dockerfile 文件名
        //         }
        //     }
        //     steps {
        //         sh './jenkins/scripts/deliver.sh'
        //     }
        // }

        // // stage('Upload to S3') {
        // //     steps {
        // //         // 上传构建产物到 S3
        // //         sh '''
        // //         aws s3 cp ./target s3://test-1234-demo-what/ --recursive --region ap-northeast-1
        // //         '''
        // //     }
        // // }


        // stage('Build Docker Image') {
        //     agent {
        //         docker {
        //             image 'docker:latest' // 使用官方 Docker 镜像
        //             args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        //         }
        //     }
        //     steps {
        //         unstash 'build-artifacts'
        //         sh 'docker build -t myapp:latest .'
        //     }
        // }

    }
}