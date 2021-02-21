pipeline {
    agent { label 'master'}

    parameters{
        string(name:'TFE_ORG', defaultValue: '', description: 'tfe organization name')
        string(name:'TFE_TOKEN', defaultValue: '', description: 'TFE_TOKEN')
        string(name:'TFE_WORKSPACE', defaultValue: '', description: 'desired workspace name')
        string(name:'TFE_OVERRIDE', defaultValue: '', description: 'default is no, choose yes to apply') 
        string(name:'TFE_DELETE', defaultValue: '', description: 'default is no, choose yes to apply')
    }
    stages {
        stage('load and run work space'){
            steps{
                  sh(
                      '''
                      bash 'scripts/loadAndRunWorkspace.sh'
        
                      '''  
                  )
            }

        }
        stage('destroy workspace'){
            steps{
                  sh(
                      '''
                      bash 'scripts/deleteWorkspace.sh'
                      '''  
                  )
            }

        }
    }
}
