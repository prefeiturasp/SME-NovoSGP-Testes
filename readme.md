# SME-NovoSGP-Testes


docker network rm sme-network
docker volume rm sgp-testes_scripts

É necessário ter o wsl ativado

docker build . -t sme-testes
docker run --name sme-testes -v /var/run/docker.sock:/var/run/docker.sock -ti sme-testes


## Requisitos

* WSL 2
* Docker
* Ubuntu (Microsoft Store)

Obs: verifique se os arquivos .sh estão no formato LF e não CRLF