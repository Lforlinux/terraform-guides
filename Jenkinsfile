pipeline {
    agent { label 'master'}

    parameters{
        string(name:'TOKEN', defaultValue: '', description: 'Terra-token')
        string(name:'token', defaultValue: '', description: 'token')
    }
    stages {
        stage('Terraform Install'){
            steps{
                  sh(
                      '''
                      sh 'scripts/terraform-install.sh'
        
                      '''  
                  )
            }

        }
        stage('Terraform init'){
            steps{
                  sh(
                      '''
                      sh 'scripts/terraform-init.sh'
                      '''  
                  )
            }

        }
        stage('Terraform Plan'){
            steps{
                  sh(
                      '''
                      sh 'scripts/terraform-plan.sh'
                      '''  
                  )
            }
        }
        stage('Terraform apply'){
            steps{
                  sh(
                      '''
                      sh 'scripts/terraform-apply.sh'
                      '''  
                  )
            }
        }
    }
}