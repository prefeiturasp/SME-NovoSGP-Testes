FROM ubuntu:21.10

ENV DEBIAN_FRONTEND=nonintercative 

RUN apt-get update -y

RUN apt install -y docker.io
RUN apt install -y expect

RUN apt -y install docker-compose

COPY docker-compose.testes.postgres.yml /app/
COPY dockerfiles /app/dockerfiles
COPY scripts /app/scripts
COPY start.sh /app/

WORKDIR /app

EXPOSE 5432

CMD ["/bin/bash", "-x", "start.sh"]

