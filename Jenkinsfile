properties([parameters([string(defaultValue: 'Hello', description: 'How should I greet the world?', name: 'Greeting')])])
node {
    checkout scm
    stage('Build') {
        sh 'docker ps'
    }
}