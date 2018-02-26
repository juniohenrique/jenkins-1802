node {
    try {
        stage("Build") {
            git 'git@github.com:qaninjahq/jenkins-1802.git'
            ruby('cd api && bundler install')
        }
        stage("Development") {
            env.RACK_ENV = 'development'
            ruby("cd api && rspec -fd --format RspecJunitFormatter --out logs/unit_tests.xml")
            junit 'api/logs/unit_tests.xml'
        }
            stage("QA") {
            sh "cd api && ./deploy.sh testing"
            env.RACK_ENV = 'testing'
            ruby("cd api && rspec -fd --format RspecJunitFormatter --out logs/func_tests.xml")
            junit 'api/logs/func_tests.xml'
        }
        stage("Production") {
            sh "ls"
        }
    }
    catch (err) {
        currentBuild = 'Deu ruim no build :('
        junit 'api/logs/*.xml'
        throw err
    }

}

def ruby(String commands) {
    sh "bash -c 'source ~/.bashrc && rbenv global 2.4.3 && ${commands}'"
}