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
                    docker build -t vamshiamruthapu/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER} .
                    docker login -u vamshiamruthapu -p "Vamshi@12345"
                    docker push vamshiamruthapu/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER}
                    docker logout
                """
            }    
        }
    }    
}