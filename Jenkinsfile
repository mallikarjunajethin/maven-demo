pipeline {
    agent any

    stages {
	    stage('Download Deploy File') {
            steps {
                withCredentials([usernamePassword(credentialsId: '5c3b71b1-b26d-4069-8a82-bc7abf78161d', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "git config --global credential.helper 'store --file=.git-credentials'"
                    sh "git clone -b development https://github.com/mallikarjunajethin/deploymnet-test.git"
                }
                // Download the deploy file (e.g., Deployment.yml)
                sh 'cd deploymnet-test'
		sh 'cp Deployment.yml Deployment.yml.backup' // Backup the original file
                // Use any suitable command to download the file, e.g., wget or curl
            }
        }

        stage('Modify Build Number') {
            steps {
                // Modify the build number in the deploy file
		sh 'cd deploymnet-test'
		sh "BUILD_NUMBER=${BUILD_NUMBER}"
                sh "sed -i 's/replaceImageTag/${BUILD_NUMBER}/g' Deployment.yml"
            }
        }

        stage('Commit and Push to Main') {
            steps {
                withCredentials([usernamePassword(credentialsId: '5c3b71b1-b26d-4069-8a82-bc7abf78161d', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'cd deploymnet-test'
		    sh "git config --global credential.helper 'store --file=.git-credentials'"
                    sh "git add ."
                    sh "git commit -m 'Update build number for deployment'"
                    sh "git push origin main"
                }
            }
        }

     post {
        always {
            cleanWs() // Clean workspace after the pipeline completes
        }
    }
    }
}
