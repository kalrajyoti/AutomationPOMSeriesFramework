pipeline {
    agent none
    stages {
        stage('Build Jar') {
            agent {
                docker {
                    image 'maven:3.9.3-eclipse-temurin-17-focal'
                    args '-u root -v /tmp/m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Image') {
            steps {
               sh 'docker build -t=335022/seleniumdocker .'
            }
        }

        stage('Push Image'){
          environment{
                        // assuming you have stored the credentials with this name
                        DOCKER_HUB = credentials('dockerhub-creds')
                    }
            steps{
                sh 'docker login -u ${DOCKER_HUB_USR} -p ${DOCKER_HUB_PSW}'
                sh 'docker push 335022/seleniumdocker'
            }
        }

    }
}