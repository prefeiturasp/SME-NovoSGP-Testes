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
						sh('cp $resource $WORKSPACE/testes/scripts/Resource.robot')
                        sh('cp $filter $WORKSPACE/testes/scripts/FiltroTurma.robot')
						sh('docker run --rm --network sme-network -v $WORKSPACE/testes/scripts:/opt/robotframework/tests -v $WORKSPACE/testes/resultados:/opt/robotframework/reports -e BROWSER=firefox -e TZ=America/Sao_Paulo ppodgorsek/robot-framework:latest')
						sh('rm -f $WORKSPACE/testes/scripts/Resource.robot')
                        sh('rm -f $WORKSPACE/testes/scripts/FiltroTurma.robot')
					}
                }
            }           
        }   
    }

  post {
    always { archiveArtifacts artifacts: '$WORKSPACE/testes/resultados/*', onlyIfSuccessful: true }
  }
}
