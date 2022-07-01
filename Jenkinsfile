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

        stage('Build core image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile -t gbrezeanu00/pregatit-demo-app-python ."
                withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push gbrezeanu00/pregatit-demo-app-python"
                }
            }
        }

        stage('Build core comment image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile -t gbrezeanu00/pregatit-demo-app-python ."
                withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push gbrezeanu00/pregatit-demo-app-python"
                }
            }
        }

        stage('Build core mover image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile -t gbrezeanu/pregatit-demo-app-python ."
                withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push gbrezeanu/pregatit-demo-app-python"
                }
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