properties([parameters([string(defaultValue: 'Hello', description: 'How should I greet the world?', name: 'Greeting')])])
node {
    checkout scm
    stage('Test') {
        // sh 'env | sort'
        echo "${params.Greeting} World!"
    }
}