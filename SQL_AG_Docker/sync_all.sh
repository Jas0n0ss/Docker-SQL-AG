/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,1401" -d "master" -U SA -P "<Password>" -Q "
CREATE CERTIFICATE dbm_certificate_1402  
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1402.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_1402.pvk',
        DECRYPTION BY PASSWORD = '<Password>'
    );
GO
CREATE CERTIFICATE dbm_certificate_1403  
AUTHORIZATION dbm_user
FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1403.cer'
WITH PRIVATE KEY (
    FILE = '/var/opt/mssql/crts/dbm_certificate_1403.pvk',
    DECRYPTION BY PASSWORD = '<Password>'
    );
GO"

/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,1402" -d "master" -U SA -P "<Password>" -Q "
CREATE CERTIFICATE dbm_certificate_1401  
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1401.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_1401.pvk',
        DECRYPTION BY PASSWORD = '<Password>'
    );
GO
CREATE CERTIFICATE dbm_certificate_1403  
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1403.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_1403.pvk',
        DECRYPTION BY PASSWORD = '<Password>'
    );
GO"

/opt/mssql-tools/bin/sqlcmd -S "127.0.0.1,1403" -d "master" -U SA -P "<Password>" -Q "
CREATE CERTIFICATE dbm_certificate_1401  
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1401.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_1401.pvk',
        DECRYPTION BY PASSWORD = '<Password>'
    );
GO
CREATE CERTIFICATE dbm_certificate_1402 
    AUTHORIZATION dbm_user
    FROM FILE = '/var/opt/mssql/crts/dbm_certificate_1402.cer'
    WITH PRIVATE KEY (
        FILE = '/var/opt/mssql/crts/dbm_certificate_1402.pvk',
        DECRYPTION BY PASSWORD = '<Password>'
    );
GO"
