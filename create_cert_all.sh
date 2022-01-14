for port in {1401..1403}
do
/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,$port" -d "master" -U SA -P "Pass2017" -Q "
CREATE LOGIN dbm_login WITH PASSWORD = 'Pass2017';
GO
CREATE USER dbm_user FOR LOGIN dbm_login;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Pass2017';
GO
CREATE CERTIFICATE dbm_certificate_$port WITH SUBJECT = 'dbm';
GO
CREATE ENDPOINT [Hadr_endpoint]
    AS TCP (LISTENER_IP = (0.0.0.0), LISTENER_PORT = 5022)
    FOR DATA_MIRRORING (
        ROLE = ALL,
        AUTHENTICATION = CERTIFICATE dbm_certificate_$port,
        ENCRYPTION = REQUIRED ALGORITHM AES
    );
GO
ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;
GO
GRANT CONNECT ON ENDPOINT::[Hadr_endpoint] TO [dbm_login];
GO
BACKUP CERTIFICATE dbm_certificate_$port
TO FILE = '/var/opt/mssql/crts/dbm_certificate_$port.cer'
WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_$port.pvk',
        ENCRYPTION BY PASSWORD = 'Pass2017'
    );
GO"
done
