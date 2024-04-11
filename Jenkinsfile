properties([parameters([string(defaultValue: 'Hello', description: 'How should I greet the world?', name: 'Greeting')])])
node('node1') {
    checkout scm
    stage('Build') {
        sh 'docker build . -t xitrin-nginx'
        sh 'docker images'
    }
    stage('Clean') {
        sh 'docker images'
    }
}