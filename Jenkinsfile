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
    stage('Test') {
        sh "docker run --rm -d --name ${params.Tag}-test ${params.Tag}"
        sh "ip=$(docker inspect ${params.Tag}-test | jq -r '.[0].NetworkSettings.Networks.bridge.IPAddress'); echo $ip"
    }
    stage('Upload') {
        sh "docker save -o ${params.Tag}-${env.BUILD_ID}.img ${params.Tag}"
        archiveArtifacts artifacts: "${params.Tag}-${env.BUILD_ID}.img"
    }
    stage('Clean') {
        sh "docker stop ${params.Tag}-test"
        sh "docker rmi ${params.Tag}"
        cleanWs()
    }
}