pipeline {
    agent { label 'master'}

    parameters{
        string(name:'TFE_ORG', defaultValue: '', description: 'Terra-org')
        string(name:'TFE_TOKEN', defaultValue: '', description: 'TFE_TOKEN')
        string(name:'TFE_workspace', defaultValue: '', description: 'TFE_workspace')
    }
      stages {
        
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
