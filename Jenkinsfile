pipeline 
{
    agent any

    stages 
    {
        stage('Checkout Repository') 
        {
            steps 
            {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SoftBinaries/CICD-Trail-Attempt1.git']])
            }
        }    
stage('Remove Old Docker Image & Container')
{
	steps
        {
		
		script
			{
			    sh 'docker rm -f goofy-nginx' 
		    	sh 'docker rmi -f s0ftdocker/cicd01:1.0'
			}
        }
} 
 stage('Build Docker Image')
        {
            steps
            {
                script
                {
                    sh 'docker build -t s0ftdocker/cicd01:1.0 .'   
	       }    
            }
            
        }
        stage('Push Docker Image')
        {
            steps
            {
                script
                {
                    
                    withCredentials([string(credentialsId: 'hockpwd', variable: 'loghubpwd')]) 
                    {
                        sh 'docker login -u s0ftdocker -p ${loghubpwd}'
                        sh 'docker push s0ftdocker/cicd01:1.0'
                    }
                }
            }
        }
        stage('Pull Docker Image')
        {
            steps
            {
                sh 'docker pull s0ftdocker/cicd01:1.0'
            }
        }
        
        stage('Run container from the image that docker pulled in')
        {
            steps
            {
                sh 'docker run --name goofy-nginx -d -p 8090:80 s0ftdocker/cicd01:1.0'
            }
        }
    }
}
