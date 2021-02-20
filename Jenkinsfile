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
                      sh 'scripts/hello.sh'
        
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