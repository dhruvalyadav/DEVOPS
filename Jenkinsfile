pipeline {
    agent any
    
    tools {
        maven 'Maven-3.8.1'
        jdk 'JDK-11'
    }
    
    environment {
        TOMCAT_URL = 'http://localhost:8080'
        TOMCAT_CREDENTIALS = credentials('tomcat-credentials')
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/dhruvalyadav/DEVOPS.git'
            }
        }
        
        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                bat """
                    curl -u %TOMCAT_CREDENTIALS% -T target/studentprofile.war "%TOMCAT_URL%/manager/text/deploy?path=/studentprofile&update=true"
                """
            }
        }
    }
    
    post {
        success {
            emailext (
                subject: "SUCCESS: Student Profile App Deployment",
                body: "Build ${env.BUILD_URL} deployed successfully!",
                to: "team@college.edu"
            )
        }
        failure {
            emailext (
                subject: "FAILED: Student Profile App Deployment",
                body: "Build ${env.BUILD_URL} failed!",
                to: "team@college.edu"
            )
        }
    }
}