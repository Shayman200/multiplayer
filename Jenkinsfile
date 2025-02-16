pipeline {
    agent any

    parameters {
        string(name: 'user_input1', defaultValue: '0', description: 'First numeric parameter')
        string(name: 'user_input2', defaultValue: '0', description: 'Second numeric parameter')
    }

    environment {
        OUTPUT_FILE = 'output.html'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Shayman200/multiplier.git' // Replace with your repository URL
            }
        }

        stage('Run Shell Script') {
            steps {
                script {
                    def output = sh(script: "bash fibvar.sh ${params.user_input1} ${params.user_input2}", returnStdout: true).trim()
                    writeFile file: OUTPUT_FILE, text: "<html><body><h1>Output</h1><p>${output}</p></body></html>"
                }
            }
        }

        stage('Display Parameters') {
            steps {
                script {
                    currentBuild.description = "Numeric parameters: ${params.user_input1}, ${params.user_input2}"
                }
            }
        }

        stage('Verify Output on Web Page') {
            steps {
                script {
                    def description = currentBuild.description
                    if (description.contains("${params.user_input1}") && description.contains("${params.user_input2}")) {
                        echo "Parameters exist on the web page."
                    } else {
                        error "Parameters do not exist on the web page."
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: OUTPUT_FILE, fingerprint: true
            publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: '.',
                reportFiles: OUTPUT_FILE,
                reportName: 'Shell Script Output'
            ])
        }
    }
}
