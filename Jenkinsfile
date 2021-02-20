pipeline {
    agent { label 'master'}

    parameters{
        string(name:'TFE_ORG', defaultValue: '', description: 'Terra-org')
        string(name:'TFE_TOKEN', defaultValue: '', description: 'TFE_TOKEN')
        string(name:'TFE_workspace', defaultValue: '', description: 'TFE_workspace')
    }
<<<<<<< HEAD
      stages {
=======
    stages {
        stage('load and run work space'){
            steps{
                  sh(
                      '''
                     
                      sh 'export TOKEN=${TFE_TOKEN} && bash ./loadAndRunWorkspace.sh ${TFE_workspace} app.terraform.io'
>>>>>>> f2c2004fe4b74f02d5ab6f4ff49c451fe9eae145
        
	    stage('Deploy using TFE API') {
            steps {
                echo 'Deploying using TFE API....'
                dir('tfe-api') {
                  sh 'export TOKEN=${TFE_TOKEN} && bash ./loadAndRunWorkspace.sh ${TFE_workspace} app.terraform.io'
                  sh 'export TOKEN=${TFE_devops_api_token} && bash ./tfe-api-get-runs.sh demo-rkm/${TFE_workspace} app.terraform.io'
                }
                // Workspace Cleanup
                cleanWs()
            }
        }

    }
}
