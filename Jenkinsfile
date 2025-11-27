pipeline {
    agent any
    stages {
        stage('Pre-check Docker') {
            steps {
                script {
                    def dockerExists = sh(script: 'which docker', returnStatus: true) == 0
                    if (!dockerExists) {
                        error "Docker is not installed or not in PATH!"
                    }
                }
            }
        }
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t novamart-svc:5 .'
            }
        }
        stage('Run Container') {
            steps {
                sh '''
                docker rm -f novamart-svc-ctr || true
                docker run -d --name novamart-svc-ctr -p 12200:12200 novamart-svc:5
                '''
            }
        }
    }
    post {
        always {
            sh 'docker ps -a'
        }
    }
}
