/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,1401" -d "master" -U SA -P "Passw0rd" -Q "
CREATE AVAILABILITY GROUP [AG]
    WITH (CLUSTER_TYPE = NONE)
    FOR REPLICA ON
    N'sqlNode1'
        WITH (
        ENDPOINT_URL = N'tcp://sqlNode1:5022',
        AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
            SEEDING_MODE = AUTOMATIC,
            FAILOVER_MODE = MANUAL,
            SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
        ),
    N'sqlNode2'
        WITH (
        ENDPOINT_URL = N'tcp://sqlNode2:5022',
        AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
            SEEDING_MODE = AUTOMATIC,
            FAILOVER_MODE = MANUAL,
            SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
        ),
    N'sqlNode3'
        WITH (
        ENDPOINT_URL = N'tcp://sqlNode3:5022',
        AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
            SEEDING_MODE = AUTOMATIC,
            FAILOVER_MODE = MANUAL,
            SECONDARY_ROLE (ALLOW_CONNECTIONS = ALL)
        );
GO"
