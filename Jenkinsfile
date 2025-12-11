pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                echo "Repository cloned successfully!"
                bat 'dir'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                bat 'echo Build completed.'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                bat 'echo Tests passed!'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying application..."
                bat 'echo Deployment completed!'
            }
        }
    }
}
