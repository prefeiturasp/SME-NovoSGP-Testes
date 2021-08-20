FROM ubuntu:20.04

ENV REGISTRY_URL=url
ENV REGISTRY_USER=user
ENV REGISTRY_PASSWORD=password
ENV DEBIAN_FRONTEND=noninteractive 
ENV ACESSO_EXTERNO=false
ENV RECRIAR_IMAGENS=true

RUN apt-get update -y

RUN apt install -y docker.io expect docker-compose git

COPY *.yml /app/

COPY dockerfiles /app/dockerfiles
COPY scripts /app/scripts
COPY testes /app/testes
COPY start.sh sme-api.env /app/

RUN git clone https://github.com/prefeiturasp/SME-NovoSGP.git /app/sgp-backend \ 
    && cp -r /app/sgp-backend/scripts /app/scripts-sgp \
    && rm -rf /app/sgp-backend

COPY /scripts/postgres/sgp-populate /app/scripts-sgp

WORKDIR /app

# CMD ["/bin/bash", "-x", "start.sh"]
ENTRYPOINT ["/bin/bash", "-x", "start.sh"] 

