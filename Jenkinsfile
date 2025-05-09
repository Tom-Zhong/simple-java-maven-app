// pipeline {
//     agent { docker { image 'maven:3.9.9-eclipse-temurin-21-alpine' } }
//     stages {
//         stage('build') {
//             steps {
//                 sh 'mvn --version'
//             }
//         }
//     }
// }
pipeline {
    agent { docker { image 'node:22.15.0-alpine3.21' } }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
}