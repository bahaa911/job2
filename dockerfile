pipeline {
    agent any
    stages {
        stage('Select Test') {
            steps {
                script {
                    def choice = input(
                        id: 'userInput',
                        message: 'Select a test:',
                        parameters: [
                            choice(name: 'TEST_CHOICE', choices: 'Test 1\nTest 2', description: 'Choose a test')
                        ]
                    )
                }
            }
        }
        stage('Trigger Job 2') {
            steps {
                script {
                    if (choice == 'Test 1') {
                        build(job: 'Job2', parameters: [string(name: 'CHOICE', value: 'script1')])
                    } else if (choice == 'Test 2') {
                        build(job: 'Job2', parameters: [string(name: 'CHOICE', value: 'script2')])
                    }
                }
            }
        }
    }
}
