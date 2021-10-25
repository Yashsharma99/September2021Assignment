pipeline {
  environment {
    imagename = "7011907111/assign4"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/Yashsharma99/September2021Assignment.git', branch: 'main', credentialsId: 'github'])
        echo "success"

      }
    }
  
     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    
    tage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
            }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
    stage('Docker  run'){
      steps{
         sh 'docker run -d --name springcon -p 8090:8080 springjen:ver1'
        }
     }
      
  }
}
