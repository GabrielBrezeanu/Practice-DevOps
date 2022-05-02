pipeline {
    agent { 
        docker { image 'python:3.10.1-alpine' } 
    }
    stages {
        stage('checkout') {
            steps {
                checkout scm
            }
        }
        stage('build') {
            steps {
                sh 'make demo-app-build'
            }
        }
    }
}