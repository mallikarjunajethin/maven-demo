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
                    docker.build("mallikarjunajethin/maven-demo:${BUILD_NUMBER}")
                }
            }
    }


    stage('push') {
            steps {
                // Log in to Docker Hub
                withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                }
                
                // Push Docker image to Docker Hub
                sh "docker push mallikarjunajethin/maven-demo:${BUILD_NUMBER}"
                
                // Log out from Docker Hub
                sh "docker logout"
            }
        }
 }
}
