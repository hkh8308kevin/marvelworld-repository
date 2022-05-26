pipeline {
    agent any
    tools {
      gradle 'gradle-7.4.2'
    }

    environment {
      //imagename = "mavelworld-deploy"
        registryCredential = 'dockerhub_access'
        dockerImage = ''
    }

    stages {
        // git에서 repository clone
        stage('Prepare') {
          steps {
            echo 'Clonning Repository'
            git url: 'https://github.com/hkh8308kevin/marvelworld-repository.git',
              branch: 'main',
              credentialsId: 'github_access'
            }
            post {
             success { 
               echo 'Successfully Cloned Repository'
             }
           	 failure {
               error 'This pipeline stops here...'
             }
          }
        }

        // gradle build
        stage('Bulid Gradle') {
          agent any
          steps {
            echo 'Bulid Gradle'
            sh 'gradle clean build --exclude-task test'            
          }
          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }   
        
        // docker build
        stage('Bulid Docker') {
          agent any
          steps {
            echo 'Bulid Docker'
              app = docker.build("hkh8308/marvelworld")
          }
          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }

        // docker push
        stage('Push Docker') {
          agent any
          steps {
            echo 'Push Docker'
            docker.withRegistry( '', registryCredential) {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
          }
          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }
    }
}