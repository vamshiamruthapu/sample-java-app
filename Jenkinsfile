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
                    tag="vamshiamruthapu/sample-java-app/`echo $BRANCH_NAME | tr [:upper:] [:lower:]`:${BUILD_NUMBER}"
                    docker build -t $tag .
                    docker login -u vamshiamruthapu -p "Vamshi@12345"
                    docker push $tag
                    docker logout
                """
            }    
        }
    }    
}