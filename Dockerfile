FROM mcr.microsoft.com/mssql/server:2017-CU23-ubuntu-16.04 

RUN /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true

EXPOSE 1433
EXPOSE 5022

ENTRYPOINT /opt/mssql/bin/sqlservr
