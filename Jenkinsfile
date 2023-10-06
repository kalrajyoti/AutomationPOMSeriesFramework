/*
    Note:

    Windows users use "bat" instead of "sh"
    For ex: bat 'docker build -t=335022/seleniumdocker .'

    Do not use "335022" to push. Use your dockerhub account
*/
pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image'){
            steps{
                sh 'docker build -t=335022/seleniumdocker .'
            }
        }

        stage('Push Image'){
            environment{
                // assuming you have stored the credentials with this name
                DOCKER_HUB = credentials('dockerhub-creds')
            }
            steps{
                // There might be a warning.
                sh 'docker login -u ${DOCKER_HUB_USR} -p ${DOCKER_HUB_PSW}'
                sh 'docker push 335022/seleniumdocker'
            }
        }

    }

    post {
        always {
            sh 'docker logout'
        }
    }

}