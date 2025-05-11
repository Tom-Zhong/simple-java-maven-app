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
                sh 'aws ecr get-login-password --region ap-northeast-1 > target/ecr_password.txt'
                stash name: 'build-artifacts', includes: 'target/**/*'
            }
        }

        stage('Read JSON') {
             script {
                // 读取 JSON 文件
                def config = readJSON file: 'fargate-task.json'
                
                // 使用 JSON 数据
                echo "Cluster Name: ${config.familyfamily}"
                echo "Repository URI: ${config.containerDefinitions}"
                echo "Region: ${config.requiresCompatibilities}"
            }
        }

        // stage('Build Docker Image') {
        //     agent any
        //     steps {
        //         unstash 'build-artifacts'
        //         sh 'docker build -t myapp:latest -f DockerfileIMG .'
        //         sh 'docker images'
        //     }
        // }

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

        // stage('Upload to S3') {
        //     agent {
        //         dockerfile {
        //             filename 'Dockerfile' // 指定 Dockerfile 文件名
        //         }
        //     }
        //     steps {
        //         // 上传构建产物到 S3
        //         // sh '''
        //         // aws s3 cp ./target s3://test-1234-demo-what/ --recursive --region ap-northeast-1
        //         // '''
                
        //     }
        // }

        // stage('Upload to ECS') {
        //     agent any
        //     steps {
        //         unstash 'build-artifacts'
        //         sh 'cat target/ecr_password.txt | docker login --username AWS --password-stdin 430517113162.dkr.ecr.ap-northeast-1.amazonaws.com'
        //         sh 'docker tag myapp:latest 430517113162.dkr.ecr.ap-northeast-1.amazonaws.com/myapp:latest'
        //         sh 'docker push 430517113162.dkr.ecr.ap-northeast-1.amazonaws.com/myapp:latest'
        //         // sh 'aws ecs create-cluster --cluster-name myapp-cluster'
        //     }
        // }

    }
}