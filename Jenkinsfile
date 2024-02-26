pipeline {    
    agent {
        label ''
    }
    environment {
        NEXUS_CREDS = credentials('nexus-creds')
    }
    stages {
        stage('Building the application') {
            agent{
                docker{
                    image 'maven:3.8.7-openjdk-18-slim'
                }
            }
            steps {
                sh """
                    mvn clean package
                    mvn sonar:sonar -Dsonar.projectKey=test-project -Dsonar.host.url=http://44.211.156.146:9000 -Dsonar.login=20065bcc2b55da46bd51328972323e52509f6e4f
                """    
            }
        }
        stage('Building the Docker image') {
            steps {
                sh """
                    docker build -t 54.235.238.149:8082/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:$BUILD_NUMBER .
                """
            }    
        }
    }    
}
