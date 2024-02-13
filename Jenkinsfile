pipeline {    
    agent {
        label 'infra'
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
                    docker login -u admin -p "Vamshi@123" 54.235.238.149:8082
                    docker push 54.235.238.149:8082/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER}
                    docker logout
                """
            }    
        }
    }    
}