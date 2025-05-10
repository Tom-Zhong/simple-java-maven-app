pipeline {
    agent {
        docker {
            image 'maven:3.9.9-amazoncorretto-21-alpine'
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}