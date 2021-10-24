pipeline {
    agent any
    // environment {
    //          imagename = "7011907111/assignment4"
    //          registryCredential = 'dockerhub'
    //          dockerImage = ''
            
//         tools {
//         jdk 'JAVA'
//         maven 'MAVEN3'
//        // docker 'docker'
//     }
    stages {
        stage('Code Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/Yashsharma99/September2021Assignment.git']]])
            }
        }
        stage('Code Build') {
            steps {
                sh'mvn clean install package'
            }
        }
        // stage('Code Quality'){
        //               steps{
        //                       withSonarQubeEnv('Sonar Qube Scanner'){  
        //                       sh 'mvn sonar:sonar'
                         
        //              }
        //         }
        // }
        //           stage("Upload To Artifactory") {
        //                         //       environment {
        //                         //       MAVEN_HOME = 'D:/download backup/apache-maven-3.8.1-bin/apache-maven-3.8.1'
        //                         //   }
        //                       steps {
                //                       rtMavenDeployer (
                //                       id: "deployer",
                //                      serverId: "artifactory",
                //                      releaseRepo: "example-repo-local",
                //                     snapshotRepo: "example-repo-local"
                //                       )
                //                      rtMavenRun (
                //                      pom: "pom.xml",
                //                      goals: "clean install",
                //                     deployerId: "deployer"
                //                         )
                //                      rtPublishBuildInfo (
                //                   serverId: "artifactory"
                //                       )
                //               }
                //   }
                                //      stage('Building image') {
                                //               steps{
                                //               script {
                                //              dockerImage = docker.build imagename
                                //                             }
                                //                       }
                                //                  }
                                //   stage('Deploy Image') {
                                //                          steps{
                                //                          script {
                                //                      docker.withRegistry( '', registryCredential ) {
                                //                     dockerImage.push("$BUILD_NUMBER")
                                //                   dockerImage.push('latest')
                                //                                     }
                                //                               }
                                //                             }
                                //                      }
                                
                                   stage('Docker Build Image') {
                                           steps{
                                                       sh "docker build -t 7011907111/assignment4 ."      }
                                               }
    
    
                                  stage('Docker Push Image') {
                                             steps{
          
                                                  withCredentials([string(credentialsId: 'dockerhub', variable: 'Docker_Bind')]) {
                                                  sh "docker login -u 7011907111 -p ${Docker_Bind}"
                                                     }
      
                                                    sh "docker push 7011907111/assignment4"
                                                 }
      
                                            }

                                stage('Docker Run Container') {
                                           steps{
                                                 sh "docker run -d -p 8088:8080 7011907111/assignment4"
                                               }
                                       }
    } 
}

