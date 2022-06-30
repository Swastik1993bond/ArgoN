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
