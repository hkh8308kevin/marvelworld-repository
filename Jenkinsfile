node {
     stage('Clone repository') {
         checkout scm
     }
     stage('Build image') {
         app = docker.build("hkh8308/marvelworld")
     }
     stage('Push image') {
         docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_access') {
             app.push("${env.BUILD_NUMBER}")
             app.push("latest")
         }
     }
}
/*
stage('Build image') {
  app = docker.build("hkh8308/marvelworld")
}

stage('Push image') {
  docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_access') 
  {
     app.push("${env.BUILD_NUMBER}")
     app.push("latest")
  }
}
*/