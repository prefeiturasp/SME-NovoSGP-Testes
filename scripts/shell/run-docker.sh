#!/usr/bin/expect -f

set timeout -1

# spawn docker-compose -f docker-compose.testes.postgres.yml up --build -d 
# expect "*done*"

# spawn docker-compose -f docker-compose.testes.flyway-sgp.yml up --build -d 
# expect "*done*"

# spawn docker-compose -f docker-compose.testes.rabbit.yml up -d
# expect "*done*"

spawn docker-compose -f docker-compose.testes.mssql.yml up --build -d 
expect "*done*"
# interact

# docker-compose -f docker-compose.testes.postgres.yml up --quiet-pull

# expect "*system is ready to accept connections"

# INTERACT