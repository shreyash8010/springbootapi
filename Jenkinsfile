pipeline {
    agent any

    environment {
        JAVA_HOME = "/usr/lib/jvm/java-21-openjdk-amd64"
        PATH = "${JAVA_HOME}/bin:${env.PATH}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh '''
                java -version
                javac -version
                mvn -version
                mvn clean package -DskipTests
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t springbootapi .'
            }
        }

   stage('Deploy') {
    steps {
        sh '''
        docker rm -f springbootapi-container || true
        docker run -d \
          --name springbootapi-container \
          -p 5000:5000 \
          springbootapi
        '''
    }
}
    }
}
