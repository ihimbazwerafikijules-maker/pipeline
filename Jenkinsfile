pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rafikijules/myapp'           // Your Docker Hub repository
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'   // Your Jenkins credentials ID
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
    steps {
        sh 'docker build -t rafikijules/myapp:latest .'
    }
}

stage('Push to Docker Hub') {
    steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh '''
                echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                docker push rafikijules/myapp:latest
            '''
        }
    }
}

