pipeline {
 
    agent {
      node { label 'master' }
    }

    options {
      buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
      disableConcurrentBuilds()
      skipDefaultCheckout()
    }
  
    stages {

        stage('CheckOut') {            
            steps { checkout scm }            
        }
	    
        stage('Testes'){      
            steps {
                script{
			withCredentials([file(credentialsId: "sgp_robot_resource", variable: 'resource'), file(credentialsId: "sgp_robot_filter", variable: 'filter')]){
			  sh('mv $resource testes/scripts/Resource.robot')
                          sh('mv $filter testes/scripts/FiltroTurma.robot')
			  sh('docker run --rm -v $(pwd)/testes/scripts:/opt/robotframework/tests -v $(pwd)/testes/resultados:/opt/robotframework/reports -e BROWSER=firefox -e TZ=America/Sao_Paulo ppodgorsek/robot-framework:latest')
				}
                }
            }           
        }   
    }

  post {
    always { archiveArtifacts artifacts: 'testes/resultados/*', onlyIfSuccessful: true }
  }
}
