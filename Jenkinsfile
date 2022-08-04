node {
    def app

    stage('Clone repository') {
        checkout scm
    }
    stage('Build & tag image') {
     sh '''
       #!/bin/bash
       cd ArgoN/
       docker build -t test .
       docker tag test swastik93/devops-learning1993:${BUILD_NUMBER}
       docker rmi python:3.8-slim-buster
      ''' 
    }
    stage('Push image') {
     sh '''
       #!/bin/bash
       docker login -u swastik93 -p Jamesbond@007
       docker push swastik93/devops-learning1993:${BUILD_NUMBER}
       '''
    }
}
