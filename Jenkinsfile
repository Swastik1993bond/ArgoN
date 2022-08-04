node {
    def app

    stage('Clone repository') {
        checkout scm
    }
    stage('Build & tag image') {
     sh '''
       #!/bin/bash
       cd ArgoN/
       docker build -t argon .
       docker tag test swastik93/nginx:${BUILD_NUMBER}
       docker rmi nginx
      ''' 
    }
    stage('Push image') {
     sh '''
       #!/bin/bash
       docker login -u swastik93 -p Jamesbond@007
       docker push swastik93/nginx:${BUILD_NUMBER}
       '''
    }
}
