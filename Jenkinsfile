pipeline {
    
    agent any
    
    parameters {
        booleanParam(name: 'NOCACHE', defaultValue: false, description: 'Run docker build with --no-cache')
        string(name: 'NOTIFY_CHANNEL', defaultValue: '#jenkinstest', description: 'Rocket.Chat channel(s) to notify (comma-separated)')
    }

    options {
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }
    
    triggers {
        pollSCM('H/15 * * * *')
    }
    
    environment {
        NS = 'openanalytics'
        DOCKER_BUILD_ARGS = "--build-arg http_proxy='http://webproxy.openanalytics.eu:8080' --build-arg https_proxy='http://webproxy.openanalytics.eu:8080' --build-arg no_proxy='localhost,127.0.0.0,127.0.0.1,openanalytics.eu'"
    }
    
    stages {
    
        stage('build shinyproxy-demo image') {
        
            steps {
            
                script {
                     def image = docker.build(
                        "${env.NS}/shinyproxy-demo",
                        ("${params.NOCACHE}".toBoolean() ? '--no-cache ' : '') + "${env.DOCKER_BUILD_ARGS} .")
                }
            
            }
            
        }
        
        stage('push shinyproxy-demo image') {
        
            steps {
            
                withDockerRegistry([
                        credentialsId: "52b706f7-b775-4fcc-83c2-3f51853250e5",
                        url: ""]) {
                        
                    sh "docker push ${env.NS}/shinyproxy-demo"
        
                }
                
            }
            
        }
     
    }
    
    post {
        success {
            rocketSend channel: "${params.NOTIFY_CHANNEL}", message: "Build Successful - ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", rawMessage: true
        }
        failure {
            rocketSend channel: "${params.NOTIFY_CHANNEL}", message: "Build Failed - ${env.JOB_NAME} #${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", rawMessage: true
        }
    }
    
}
