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

    stage('Deploy') {
            steps {
                // Push Docker image to a registry
                script {
                    docker.withRegistry('https://hub.docker.com/', 'docker-hub-cred') {
                        docker.image('mallikarjunajethin/maven-demo:${BUILD_NUMBER}').push()
                    }
                }  
            }
       }
    }
}
