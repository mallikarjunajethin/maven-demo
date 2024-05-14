pipeline {
    agent any
    stages {
            stage('Cleanup Workspace') {
            steps {
                cleanWs()
            }
        }
	    stage('datacopy') {
       steps {
        	git credentialsId: '5c3b71b1-b26d-4069-8a82-bc7abf78161d', 
                url: 'https://github.com/mallikarjunajethin/deploymnet-test.git',
                branch: 'main'
      }
    }
	    stage('Download Deploy File') {
            steps {
                sh 'cp Deployment.yml Deployment.yml.backup' // Backup the original file
                // Use any suitable command to download the file, e.g., wget or curl
            }
        }

        stage('Modify Build Number') {
            steps {
                // Modify the build number in the deploy file
		
		sh "BUILD_NUMBER=${BUILD_NUMBER}"
                sh "sed -i 's/replaceImageTag/${BUILD_NUMBER}/g' Deployment.yml"
            }
        }

        stage('Commit and Push to Main') {
      	      environment {
        	    GITHUB_TOKEN = credentials('5c3b71b1-b26d-4069-8a82-bc7abf78161d')
      		}
		steps {
            	   script {
		    sh "git config --global credential.helper store" // Optional: Store credentials locally
                    sh "git config --global user.email 'mallikarjuna.jethin@gmail.com'"
                    sh "git config --global user.name 'mallikarjunajethin'"
                    sh "git push https://$GITHUB_TOKEN@github.com/mallikarjunajethin/deploymnet-test.git main"
                }
            }
    }   
    }
}
