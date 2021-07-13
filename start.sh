#!/usr/bin/expect -f
set dnpath [lindex $argv 0]
set timeout -1

spawn docker-compose -f docker-compose.testes.postgres.yml up

expect "*system is ready to accept connections"

INTERACT