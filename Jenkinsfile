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
//                         echo "Terraform action is --> ${action}"
//                         bat "terraform ${action} --auto-approve"
//                     
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
   
   
   
   stage('image ecr aws'){
       agent {
          label 'ubuntu'
       }
        steps{
               sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 876724398547.dkr.ecr.ap-south-1.amazonaws.com"
               sh "docker build -t myassignment6 ."
               sh "docker tag myassignment6:latest 876724398547.dkr.ecr.ap-south-1.amazonaws.com/myassignment6:latest"
               sh "docker push 876724398547.dkr.ecr.ap-south-1.amazonaws.com/myassignment6:latest"           
          }
        }
   stage('Ec2-deploy'){
       agent {
               label 'ubuntu'
           }
          steps{
                   sshagent(['ec2cred']) {
                   
                    sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 876724398547.dkr.ecr.ap-south-1.amazonaws.com'
                    sh 'docker pull 876724398547.dkr.ecr.ap-south-1.amazonaws.com/myassignment6:latest'
                    sh 'docker run -d --name ECRassignment7 -p 8092:8080 876724398547.dkr.ecr.ap-south-1.amazonaws.com/myassignment6:latest'
       
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
