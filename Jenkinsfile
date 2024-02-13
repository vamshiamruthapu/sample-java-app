pipeline {    
    agent {
        label 'infra'
    }
    environment {
        NEXUS_CREDS = credentials('nexus-creds')
    }
    stages {
        stage('Building the application') {
            steps {
                sh """
                    mvn clean package
                """    
            }
        }
        stage('Building the Docker image') {
            steps {
                sh """
                    docker build -t 54.235.238.149:8082/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER} .
                    docker login -u $NEXUS_CREDS_USR -p $NEXUS_CREDS_PSW 54.235.238.149:8082
                    docker push 54.235.238.149:8082/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER}
                    docker rmi 54.235.238.149:8082/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER}
                    docker logout 54.235.238.149:8082
                """
            }    
        }
    }    
}