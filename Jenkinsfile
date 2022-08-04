node {
    def app
    stage('Clone repository') {
        checkout scm
    }
    stage('Build & Tag image') {
     sh '''
       #!/bin/bash
       cd ArgoN/
       docker build -t argon .
       docker tag argon swastik93/nginx:${BUILD_NUMBER}
       docker rmi nginx:alpine
      ''' 
    }
    stage('Push Image to Dockerhub') {
      withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'docker_PASSWORD', usernameVariable: 'docker_USERNAME')])
      {
     sh '''
       #!/bin/bash
       docker login -u ${docker_USERNAME} -p ${docker_PASSWORD}
       docker push swastik93/nginx:${BUILD_NUMBER}
       '''
      }
    }
    }
    stage('Update manifest -repo') {
      withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')])
      {
      sh '''
       #!/bin/bash
        git config user.email swastikmukherjee276@gmail.com
        git config user.name Swastik
        cat deployment.yaml
        sed -i 's+swastik93/nginx.*+swastik93/nginx:${env.BUILD_NUMBER}+g' deployment.yaml"
        cat deployment.yaml
        git add .
        git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'
        git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/ArgoN-manifest.git
        '''
        }
    }
}
