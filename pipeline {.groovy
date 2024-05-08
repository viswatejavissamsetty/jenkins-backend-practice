pipeline {
    agent any

    environment {
        // Define any environment variables needed for your build and deployment process
        NODE_VERSION = '18' // Specify the Node.js version
        NPM_VERSION = '9' // Specify the npm version
        APP_NAME = 'DemoApp' // Specify your NestJS application name
        PI_HOST = 'pi' // Specify the hostname or IP address of your Raspberry Pi
        PI_USERNAME = 'pi' // Specify the username for SSH access to your Raspberry Pi
        PI_PASSWORD = '1998' // Specify the password for SSH access to your Raspberry Pi
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system (e.g., Git)
                git 'https://github.com/viswatejavissamsetty/jenkins-backend-practice.git'
            }
        }

        stage('Build') {
            steps {
                // Set up Node.js and npm
                sh 'pnpm install'

                // Build your NestJS application
                sh 'pnpm run build'
            }
        }
    }
}
