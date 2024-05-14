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
            steps {
                withCredentials([usernamePassword(credentialsId: '5c3b71b1-b26d-4069-8a82-bc7abf78161d', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {

		    sh "git config --global credential.helper 'store --file=.git-credentials'"
                    sh "git add ."
                    sh "git commit -m 'Update build number for deployment'"
                    sh "git push origin main"
                }
            }
        }

     
    }
}
