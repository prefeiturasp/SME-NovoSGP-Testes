/opt/mssql/bin/sqlservr & sleep 30
# Wait 30 seconds for it to be available
# (lame, I know, but there's no nc available to start prodding network ports)

# Run every script in /scripts
        # TODO set a flag so that this is only done once on creation, 
        #      and not every time the container runs
for foo in /scripts/*.sql
    do /opt/mssql-tools/bin/sqlcmd -U sa -P $$SA_PASSWORD -l 30 -e -i $$foo
done
        # So that the container doesn't shut down, sleep this thread
sleep infinity