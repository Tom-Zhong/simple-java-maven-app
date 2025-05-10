pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile' // 指定 Dockerfile 文件名
            additionalBuildArgs '--no-cache' // 可选：添加构建参数
        }
    }
    stages {
        stage('Build') { 

            steps {
                sh 'aws configure import --csv file:///tmp/.aws/credentials.csv'
                sh 'mvn --version'
                sh 'aws configure list'
                sh 'aws --version'
                sh 'aws s3api list-buckets'
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