FROM ubuntu:21.10

ENV DEBIAN_FRONTEND=nonintercative 

RUN apt-get update -y

RUN apt install -y docker.io expect docker-compose git

COPY docker-compose.testes.postgres.yml /app/
COPY docker-compose.testes.flyway-sgp.yml /app/
COPY docker-compose.testes.rabbit.yml /app/
COPY docker-compose.testes.mssql.yml /app/

COPY dockerfiles /app/dockerfiles
COPY scripts /app/scripts
COPY start.sh /app/

RUN git clone https://github.com/prefeiturasp/SME-NovoSGP.git /app/sgp-backend \ 
    && cp -r /app/sgp-backend/scripts /app/scripts-sgp \
    && rm -rf /app/sgp-backend

COPY /scripts/postgres/sgp-populate /app/scripts-sgp

WORKDIR /app

CMD ["/bin/bash", "-x", "start.sh"]

