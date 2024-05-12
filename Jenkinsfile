pipeline {
  agent any
  stages {
//    stage('Checkout') {
//       steps {
//        sh 'echo passed'
//        git branch: 'main', url: 'https://github.com/mallikarjunajethin/maven-demo.git'
//      }
//    }
//    stage('Build Maven Project') {
//        steps {
//                sh 'mvn clean package'
//            }
//    }

//    stage('Build Docker Image') {
//            steps {
//                script {
//                    docker.build("mallikarjunajethin/maven-demo:${BUILD_NUMBER}")
//                }
//            }
//    }


//    stage('push') {
//            steps {
//                // Log in to Docker Hub
//                withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
//                    sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
//                }
                
                // Push Docker image to Docker Hub
//                sh "docker push mallikarjunajethin/maven-demo:${BUILD_NUMBER}"
                
 //               // Log out from Docker Hub
 //               sh "docker logout"
 //           }
 //       }
    stage('Checkout') {
       steps {
        sh 'echo passed'
        git branch: 'development', url: 'https://github.com/mallikarjunajethin/deploymnet-test.git'
      }
    }
    stage('Update Deployment File') {
        environment {
            GIT_REPO_NAME = "deploymnet-test"
            GIT_USER_NAME = "mallikarjunajethin"
        }
	steps {
            script{
                withCredentials([usernamePassword(credentialsId: 'cf6f7bba-381b-4d28-a987-a63a0f09467e', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh '''
		    BUILD_NUMBER=${BUILD_NUMBER}
                    sed -i "s/replaceImageTag/${BUILD_NUMBER}/g" Deployment.yml
                    git add Deployment.yml
                    git commit -m "Update deployment image to version ${BUILD_NUMBER}"
		    git remote -v
                    git push https://github.com/mallikarjunajethin/deploymnet-test.git HEAD:main 
		    '''
		 }
	   }
	}
      }
   }
}
