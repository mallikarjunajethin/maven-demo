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

    
    }
}
