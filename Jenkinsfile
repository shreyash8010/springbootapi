pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shreyash8010/springbootapi.git'
            }
        }

        stage('Build') {
            steps {
                sh '''
                java -version
                mvn -version
                mvn clean package -DskipTests
                '''
            }
        }

        stage('Docker Image') {
            steps {
                sh 'docker build -t springbootapi .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker rm -f springbootapi-container || true
                docker run -d --name springbootapi-container -p 8080:8080 springbootapi
                '''
            }
        }
    }
}
