pipeline {
    agent { label 'docker-slave'}

    parameters{
        string(name:'TFE_ORG', defaultValue: '', description: 'tfe organization name')
        string(name:'TFE_TOKEN', defaultValue: '', description: 'TFE_TOKEN')
        string(name:'TFE_WORKSPACE', defaultValue: '', description: 'desired workspace name')
        string(name:'TFE_OVERRIDE', defaultValue: '', description: 'default is no, choose yes to apply')
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
        stage('Terraform init'){
            steps{
                  sh(
                      '''
                      sh 'scripts/init.sh'
                      '''  
                  )
            }

        }
        stage('Terraform Plan'){
            steps{
                  sh(
                      '''
                      sh 'scripts/plan.sh'
                      '''  
                  )
            }
        }
        stage('Terraform apply'){
            steps{
                  sh(
                      '''
                      sh 'scripts/apply.sh'
                      '''  
                  )
            }
        }
    }
}