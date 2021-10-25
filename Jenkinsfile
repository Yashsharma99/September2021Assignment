pipeline {
//   environment {
//     imagename = "7011907111/assign4"
//     registryCredential = 'dockerhub'
//     dockerImage = ''
//   }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/Yashsharma99/September2021Assignment.git', branch: 'main', credentialsId: 'github'])
        echo "success"

      }
    }
    stage('Docker create Image')
{
      steps{
               sh 'docker build -t springjen:ver1 .'
             }
         }
stage('Pre Container check')
   {
         steps{
           sh 'if [ "$(docker ps -q -f name=springcon)" ] && [ "$(docker port springcon 8080)" ]; then docker stop springcon && docker rm springcon; fi'
                }
        }
            stage('Docker Deploy')
       {
           steps{
                  sh 'docker run -d --name springcon -p 8090:8080 springjen:ver1'
                   }
           }
  }
}
