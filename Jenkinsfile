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

    stage('Build and Push Docker Image') {
      environment {
        DOCKER_IMAGE = "mallikarjunajethin/maven-demo:${BUILD_NUMBER}"
        REGISTRY_CREDENTIALS = credentials('docker-hub-cred')
      }
      steps {
        script {
            def dockerImage = docker.image("${DOCKER_IMAGE}")
            docker.withRegistry('https://docker.io', "docker-hub-cred") {
                dockerImage.push()
            }
        }
      }
}
    }
 }
}
