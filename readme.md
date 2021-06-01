# docker stop sme-mssql-testes && docker rm sme-mssql-testes
docker stop sme-flyway-testes && docker rm sme-flyway-testes 
docker stop sme-postgres-testes && docker rm sme-postgres-testes 
docker stop sme-webclient-testes && docker rm sme-webclient-testes
docker stop sme-api-testes && docker rm sme-api-testes
docker stop sme-rabbitmq-testes && docker rm sme-rabbitmq-testes

docker volume rm sgp-testes_scripts
docker volume rm sgp-testes_projects
docker volume rm sgp-testes_sgp-backend