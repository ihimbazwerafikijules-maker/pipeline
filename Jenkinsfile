pipeline {
    agent any

    environment {
        DOCKER_HUB = credentials('docker-hub') // the ID of the Jenkins credential
        IMAGE_NAME = "myimage:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // $DOCKER_HUB_USR and $DOCKER_HUB_PSW are provided automatically
                sh 'echo $DOCKER_HUB_PSW | docker login -u $DOCKER_HUB_USR --password-stdin'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Local Docker Host') {
            steps {
                sh 'docker stop mycontainer || true'
                sh 'docker rm mycontainer || true'
                sh 'docker run -d --name mycontainer -p 8080:8080 $IMAGE_NAME'
            }
        }
    }
}
