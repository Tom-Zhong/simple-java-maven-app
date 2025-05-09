pipeline {
    agent { docker 'maven:3.9.8' }
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}