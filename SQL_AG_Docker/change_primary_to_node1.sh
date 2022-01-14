/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,1401" \
	-d "master" \
	-U SA \
	-P "<Password>" \
	-Q "ALTER AVAILABILITY GROUP [AG] FORCE_FAILOVER_ALLOW_DATA_LOSS"
