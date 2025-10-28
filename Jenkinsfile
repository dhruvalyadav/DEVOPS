pipeline {
    agent any
    
    environment {
        TOMCAT_URL = 'http://localhost:8080'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/dhruvalyadav/DEVOPS.git'
            }
        }
        
        stage('Build & Package') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                script {
                    // Method 1: Using deploy plugin
                    deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: "${TOMCAT_URL}")], 
                          contextPath: 'studentprofile', 
                          war: 'target/studentprofile.war'
                }
            }
        }
    }
    
    post {
        success {
            echo '✅ SUCCESS: Student Profile App deployed successfully!'
            echo "🌐 Access your application: ${TOMCAT_URL}/studentprofile"
        }
        failure {
            echo '❌ FAILED: Deployment failed! Check the logs above.'
        }
    }
}
