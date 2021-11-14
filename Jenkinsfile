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
    
    stage('amazon-ecs'){
        steps {
            script{
                sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 711885951967.dkr.ecr.ap-south-1.amazonaws.com"
                sh "docker build -t assignment ."
                sh "docker tag assignment:latest 711885951967.dkr.ecr.ap-south-1.amazonaws.com/assignment:latest"
                sh "docker push 711885951967.dkr.ecr.ap-south-1.amazonaws.com/assignment:latest"
            }
        }
    }
    stage('Docker  run'){
      steps{
         sh 'docker run -d --name assignment:latest 711885951967.dkr.ecr.ap-south-1.amazonaws.com/assignment:latest" -p 8091:8080'
        }
     }
   
   
  
//      stage('Building image') {
//       steps{
//         script {
//           dockerImage = docker.build imagename
//         }
//       }
//     }
    
//     stage('Deploy Image') {
//       steps{
//         script {
//           docker.withRegistry( '', registryCredential ) {
//             dockerImage.push("$BUILD_NUMBER")
//              dockerImage.push('latest')
//             }
//         }
//       }
//     }
//     stage('Remove Unused docker image') {
//       steps{
//         sh "docker rmi $imagename:$BUILD_NUMBER"
//          sh "docker rmi $imagename:latest"

//       }
//     }
//     stage('Docker  run'){
//       steps{
//          sh 'docker run -d --name mycont -p 8091:8080 7011907111/assign4 '
//         }
//      }
      
  }
}
