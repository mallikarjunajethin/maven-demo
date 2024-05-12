pipeline {
  agent any
  stages {
    stage('Checkout') {
       steps {
        sh 'echo passed'
        git branch: 'main', url: 'https://github.com/mallikarjunajethin/maven-demo.git'
      }
    }
    stage('Build Maven Project') {
        steps {
                sh 'mvn clean package'
            }
    }

    stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
    }

    stage('Push Docker Image') {
		environment {
        DOCKER_REGISTRY_CREDENTIALS = credentials('docker-hub-cred')
        DOCKER_IMAGE_NAME = 'mallikarjunajethin/maven-demo'
        DOCKER_IMAGE_TAG = 'latest'
            }
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-cred') {
                            docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
                        }
                    }
                }
            }
        }
    }
}
