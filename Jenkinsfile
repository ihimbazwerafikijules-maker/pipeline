pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = credentials('rafikijules/myapp') // Jenkins credentials ID
        DOCKER_HUB_PASS = credentials('dckr_pat_5rxjd3fOY9ahngeigN5Idw2LqNs') // Jenkins credentials ID
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
                // Log in and push image to Docker Hub
                sh 'echo $DOCKER_HUB_PASS | docker login -u $DOCKER_HUB_USER --password-stdin'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Local Docker Host') {
            steps {
                // Optional: run the image locally
                sh 'docker stop mycontainer || true'
                sh 'docker rm mycontainer || true'
                sh 'docker run -d --name mycontainer -p 8080:8080 $IMAGE_NAME'
            }
        }
    }
}
