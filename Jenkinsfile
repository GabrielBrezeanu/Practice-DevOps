pipeline {

    agent any

//   environment {
//         dockerhub=credentials('dockerhub_id')
//     }

    environment {

        tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()

        def BUILDVERSION = sh(script: "echo `date +%s`", returnStdout: true).trim()

    }


  stages {

    stage("Awesome Stage") {
            steps {
                echo "Current build version :: $BUILDVERSION"
            }
        }

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/GabrielBrezeanu/Practice-DevOps.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
                script {
                    myapp = docker.build("gbrezeanu00/pregatit-demo-app-python:${env.BUILD_ID}")
                }
            }
        }
    
    //   stage('push') {
    //         steps {

    //             // sh "env"
    //             sh "docker logout"
    //             sh "echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin docker.io"
    //             sh 'make demo-app-push'

    //         } 
            
    //     }

        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_id') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            } 
            
        }
        
    stage("Tag"){
        steps {
            echo "Tag :: $tag"
        }
    }
    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "pregatit-demo-app-python.yml", kubeconfigId: "kubeconfig")
        }       
      }      
    }

  }

}