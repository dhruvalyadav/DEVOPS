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
        
        stage('Deploy to Tomcat') {
            steps {
                bat '''
                    echo "Deploying WAR file to Tomcat..."
                    copy target\\studentprofile.war "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\"
                    echo "✅ WAR file deployed successfully!"
                '''
            }
        }
    }
    
    post {
        always {
            echo "🌐 Application URL: http://localhost:8080/studentprofile"
        }
        success {
            echo '🎉 PIPELINE SUCCESS! Student Profile App is LIVE!'
            echo '✅ Build: SUCCESS'
            echo '✅ Package: SUCCESS' 
            echo '✅ Deployment: SUCCESS'
        }
    }
}
