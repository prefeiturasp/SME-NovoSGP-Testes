#!/usr/bin/expect -f

set timeout -1

spawn ./scripts/shell/start-rabbit.sh
expect "*rabbitmq_web_dispatch*"

spawn ./scripts/shell/start-postgres.sh
expect "*database system is ready to accept connections*"

spawn ./scripts/shell/start-sgp-flyway.sh
expect "*Successfully applied*"

spawn ./scripts/shell/start-mssql.sh
expect "*SQLSERVER FINALIZADO*"

spawn ./scripts/shell/start-sgp-worker-rabbit.sh
expect "*Application started. Press Ctrl+C to shut down*"

spawn ./scripts/shell/start-sgp-worker-service.sh
expect "*Application started. Press Ctrl+C to shut down*"

spawn ./scripts/shell/start-api-eol-worker.sh
expect "*Application started. Press Ctrl+C to shut down*"

spawn ./scripts/shell/start-api-eol.sh
expect "*Application started. Press Ctrl+C to shut down*"

spawn ./scripts/shell/start-sgp-api.sh
expect "*Application started. Press Ctrl+C to shut down*"

spawn ./scripts/shell/start-sgp-webclient.sh
expect "*URL_SONDAGEM*"

# INTERACT