pipeline {
    agent any

    environment {
        DOCKER_HUB = credentials('docker-hub') // Jenkins credential ID
        IMAGE_NAME = "myimage:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from GitHub
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Login to Docker Hub using Jenkins credentials and push image
                sh 'echo $DOCKER_HUB_PSW | docker login -u $DOCKER_HUB_USR --password-stdin'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Local Docker Host') {
            steps {
                // Stop and remove existing container (if any) and run the new image
                sh 'docker stop mycontainer || true'
                sh 'docker rm mycontainer || true'
                sh 'docker run -d --name mycontainer -p 8080:8080 $IMAGE_NAME'
            }
        }
    }
}
