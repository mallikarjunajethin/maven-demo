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
               git credentialsId: 'git-hub-login', url: https://github.com/
		       }
		//withCredentials([string(credentialsId: 'git-hub-login', variable: 'GITHUB_TOKEN')]) {
                //sh '''
                //    git config user.email "mallikarjuna.jethin@gmail.com"
                //    git config user.name "mallikarjunajethin"
                //    def buildNumber = env.BUILD_NUMBER
                //    sed -i 's/BUILD_NUMBER/${buildNumber}/g' deploymnet-test/deployment.yml
                //    git add deploymnet-test/deployment.yml
                //    git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                //    //git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main 
		//'''	
		//      }
		//   }
	}
 }
}
