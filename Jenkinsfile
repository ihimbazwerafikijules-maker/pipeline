pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'rafikijules/myapp'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image locally
                bat "docker build -t %DOCKER_IMAGE%:latest ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Log in to Docker Hub using Jenkins credentials and push the image
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat """
                        echo %DOCKER_PASS% | docker login -u %DOCKER_USER% --password-stdin
                        docker push %DOCKER_IMAGE%:latest
                    """
                }
            }
        }

        stage('Deploy to Local Docker Host') {
            steps {
                // Stop and remove old container, then run the new one
                bat """
                    docker rm -f my-web-app || exit 0
                    docker run -d --name my-web-app -p 8080:80 %DOCKER_IMAGE%:latest
                """
            }
        }
    }
}
