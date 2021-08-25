# SME-NovoSGP-Testes


docker network rm sme-network
docker volume rm sgp-testes_scripts

É necessário ter o wsl ativado no Windows

docker build . -t sme-testes
docker run --name sme-testes --rm -e REGISTRY_USER='USUARIO' -e REGISTRY_URL='URL_REGISTRY' -e REGISTRY_PASSWORD='SENHA' -e ACESSO_EXTERNO=true -v /var/run/docker.sock:/var/run/docker.sock -ti sme-testes


## Requisitos

* WSL 2
* Docker
* Ubuntu (Microsoft Store)

Obs: verifique se os arquivos .sh estão no formato LF e não CRLF