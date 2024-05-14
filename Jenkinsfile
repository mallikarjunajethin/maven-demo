pipeline {
  agent any
  stages {
 //   stage('Checkout') {
 //      steps {
 //       sh 'echo passed'
 //       git branch: 'main', url: 'https://github.com/mallikarjunajethin/maven-demo.git'
 //     }
 //   }
 //   stage('Build Maven Project') {
 //       steps {
 //               sh 'mvn clean package'
 //           }
 //   }

  //  stage('Build Docker Image') {
  //          steps {
  //              script {
  //                  docker.build("mallikarjunajethin/maven-demo:${BUILD_NUMBER}")
  //              }
  //          }
  //  }


  //  stage('push') {
  //          steps {
                // Log in to Docker Hub
   //             withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
    //                sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
    //            }
                
                // Push Docker image to Docker Hub
    //            sh "docker push mallikarjunajethin/maven-demo:${BUILD_NUMBER}"
                
                // Log out from Docker Hub
      //          sh "docker logout"
      //      }
      //  }
    stage('datacopy') {
       steps {
        	git credentialsId: '5c3b71b1-b26d-4069-8a82-bc7abf78161d', 
                url: 'https://github.com/mallikarjunajethin/deploymnet-test.git',
                branch: 'main'
	        sh 'cp deploy.properties deploy.properties.backup'
      }
    }
    stage('Modify Build Number') {
            steps {
		sh 'BUILD_NUMBER=${BUILD_NUMBER}'
                // Modify the build number in the deploy file
                sh "sed -i 's/replaceImageTag/${BUILD_NUMBER}/g' Deployment.yml"
            }
        }
    stage('Commit and Push to Main') {
            steps {
                git branch: 'main', url: 'https://github.com/mallikarjunajethin/deploymnet-test.git'
                git add: '.'
                git commit: '-m "Update deployment image to version ${BUILD_NUMBER}"'
                git push: '-u origin main'
            }
        }
   }
}
