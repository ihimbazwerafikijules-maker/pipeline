pipeline {
    agent any     // Means Jenkins can run this on any available machine

    // 1. ENVIRONMENT VARIABLES
    environment {
        DOCKER_IMAGE = 'rafikijules/myapp'      // Change this to your Docker Hub repo
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'    // This must match Jenkins credentials ID
    }

    stages {

        // 2. CHECKOUT CODE FROM GITHUB
        stage('Checkout') {
            steps {
                checkout scm   // Jenkins checks out the GitHub repo you configured
            }
        }

        // 3. BUILD DOCKER IMAGE
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        // 4. PUSH IMAGE TO DOCKER HUB
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry(
                        'https://index.docker.io/v1/',
                        DOCKER_CREDENTIALS_ID
                    ) {
                        dockerImage.push('latest')   // Pushes the image to Docker Hub
                    }
                }
            }
        }
    }
}
