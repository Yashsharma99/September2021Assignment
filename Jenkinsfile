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
//      stage ("terraform init") {
//             steps {
//                 bat ('terraform init') 
//             }
//         }
        
//         stage ("terraform Action") {
//             steps {
//                     withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'ECR', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
//                         bat 'terraform init'
//                         bat 'terraform destroy -auto-approve'
//                     }
               
//            }
//         }   
   
 
   
   stage('Build docker image'){
       agent {
          label 'ubuntu'
       }
        steps{
          //  unstash 'source'
              script {
              dockerImage = docker.build imagename
          }
        }
       }
         stage('Push docker image'){
            agent {
           label 'ubuntu'
              }
              steps{
                    script {
                        docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                         dockerImage.push('latest')
            }
        }
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
