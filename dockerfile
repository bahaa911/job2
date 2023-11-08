pipeline {
    agent any

    parameters {
        choice(
            name: 'TEST',
            choices: 'Test 1\nTest 2',
            description: 'Select the test to run:'
        )
    }

    stages {
        stage('Run Job 1 or Job 2') {
            when {
                expression { params.TEST == 'Test 1' }
            }
            steps {
                build job: 'job1_pipeline'
            }
            when {
                expression { params.TEST == 'Test 2' }
            }
            steps {
                build job: 'job1_pipeline'
                parameters: [choice(name: 'JMETER_SCRIPT', value: 'opensource-orangehrmlive1.jmx')]
            }
        }
    }
}
