pipeline {
    agent {
        docker {
            image 'maven:3.9.9-amazoncorretto-17-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn --version'
                sh 'apt-get update'
                sh 'apt-get install -y python3 python3-pip'
                sh 'python3 --version && pip3 --version'
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