pipeline {

    agent any

//   environment {
//         dockerhub=credentials('dockerhub_id')
//     }

    environment {
        tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }


  stages {

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

        stage('Build core lodestone image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile.lodestone -t mirantiseng/lodestone:${tag} ."
                withCredentials([usernamePassword(credentialsId: 'common-dockerhub-up', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push mirantiseng/lodestone:${tag}"
                }
            }
        }
        stage('Build core lodestone-comment image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile -t mirantiseng/lodestone-comment:${tag} ."
                withCredentials([usernamePassword(credentialsId: 'common-dockerhub-up', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push mirantiseng/lodestone-comment:${tag}"
                }
            }
        }
        stage('Build core lodestone-mover image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile.mover -t mirantiseng/lodestone-mover:${tag} ."
                withCredentials([usernamePassword(credentialsId: 'common-dockerhub-up', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push mirantiseng/lodestone-mover:${tag}"
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

    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "pregatit-demo-app-python.yml", kubeconfigId: "kubeconfig")
        }       
      }      
    }

  }

}