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

        stage('Python') {
            agent { docker '3.11.12-bullseye' } 
            steps {
                echo 'python --version '
                sh 'pip3 --version'
            }
        }
    }
}