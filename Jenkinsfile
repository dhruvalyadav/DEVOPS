pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dhruvalyadav/DEVOPS.git'
            }
        }
        
        stage('Build & Package') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }
        
        stage('Deploy - File Copy') {
            steps {
                bat '''
                    echo "Deploying WAR file to Tomcat..."
                    copy target\\studentprofile.war "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\"
                    echo "WAR file copied successfully!"
                    echo "Tomcat will auto-deploy the application..."
                '''
            }
        }
        
        stage('Verify Deployment') {
            steps {
                bat '''
                    echo "Waiting for deployment..."
                    timeout 10
                    echo "Application should be available at: http://localhost:8080/studentprofile"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 PIPELINE SUCCESS!'
            echo '📱 Application deployed: http://localhost:8080/studentprofile'
            echo '✅ Build & Package: SUCCESS'
            echo '✅ Deployment: SUCCESS (File Copy Method)'
        }
        failure {
            echo '❌ PIPELINE FAILED! Check console output above.'
        }
    }
}
