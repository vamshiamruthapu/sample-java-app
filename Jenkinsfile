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
                    mvn sonar:sonar -Dsonar.projectKey=test-project -Dsonar.host.url=http://localhost:9000 -Dsonar.login=d6a9148b41ebaa85c3e11f0c8ed11fe619c910e1
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
