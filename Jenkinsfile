node {
    stage("Build") {
        git 'git@github.com:qaninjahq/jenkins-1802.git'
        ruby('cd api && bundler install')
    }
    stage("UniTest") {
        ruby("cd api && rspec -fd --format RspecJunitFormatter --out logs/unit_tests.xml")
        junit 'api/logs/unit_tests.xml'
    }
    stage("Deploy to QA") {
        sh "ls"
    }
    stage("Run Functional Tests") {
         sh "ls"
    }
    stage("Deploy to Production") {
         sh "ls"
    }
}

def ruby(String commands) {
    sh "bash -c 'source ~/.bashrc && rbenv global 2.4.3 && ${commands}'"
}