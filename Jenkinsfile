pipeline {
    agent { label 'master'}

    parameters{
        string(name:'TFE_ORG', defaultValue: '', description: 'Terra-org')
        string(name:'TFE_TOKEN', defaultValue: '', description: 'TFE_TOKEN')
        string(name:'TFE_workspace', defaultValue: '', description: 'TFE_workspace')
    }
    stages {
        stage('load and run work space'){
            steps{
                  sh(
                      '''
                     
                      sh 'scripts/init.sh'
        
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
