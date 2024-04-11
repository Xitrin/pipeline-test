properties(
    [
        parameters(
            [
                string(
                    name: 'Tag',
                    description: 'What is our tag?',
                    defaultValue: 'xitrin-nginx'
                )
            ]
        )
    ]
) // end of properties

node('node1') {
    checkout scm
    stage('Build') {
        sh "docker build . -t ${params.Tag}"
        sh 'docker images'
    }
    stage('Upload') {
        sh "docker save -o ${params.Tag}.img ${params.Tag}"
        archiveArtifacts artifacts: "${params.Tag}.img"
    }
    stage('Clean') {
        sh "docker rmi ${params.Tag}"
        cleanWs()
    }
}