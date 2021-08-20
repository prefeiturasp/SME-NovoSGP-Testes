#!/usr/bin/env bash
if $ACESSO_EXTERNO; 
then
    export SGP_URL=http://localhost:5000/api
else
    export SGP_URL=http://sme-sgp-api-testes/api
fi

docker login --username=$REGISTRY_USER $REGISTRY_URL --password=$REGISTRY_PASSWORD


chmod +x ./scripts/shell/start-rabbit.sh
chmod +x ./scripts/shell/start-postgres.sh
chmod +x ./scripts/shell/start-sgp-flyway.sh
chmod +x ./scripts/shell/start-mssql.sh
chmod +x ./scripts/shell/start-sgp-worker-rabbit.sh
chmod +x ./scripts/shell/start-sgp-worker-service.sh
chmod +x ./scripts/shell/start-api-eol-worker.sh
chmod +x ./scripts/shell/start-api-eol.sh
chmod +x ./scripts/shell/start-sgp-api.sh
chmod +x ./scripts/shell/start-sgp-webclient.sh
chmod +x ./scripts/shell/run-docker.sh

chmod a+rwx ./testes/resultados
chmod a+rwx ./testes/scripts
./scripts/shell/run-docker.sh

# sleep infinity