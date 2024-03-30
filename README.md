# SQL Server AG with 3 Nodes on Docker
---
### Environment

  - Node1: `sqlNode1` `1401->1433` `1521->5022` (Primary Node)
  - Node2: `sqlNode1` `1402->1433` `1522->5022` (Secondary Node)
  - Node3: `sqlNode1` `1403->1433` `1523->5022` (Secondary Node)

### STEPS

- Prepare the Dockerfile with HA feather [Dockerfile](SQL_AG_Docker/Dockerfile)
- Build image with Dockerfile just created [create_ha_image.sh](SQL_AG_Docker/create_ha_image.sh)
- Create `docker-compsoe.yml` to create 3 nodes [docker-compose.yml](SQL_AG_Docker/docker-compose.yml)
- Create the SQL server nodes with the image which with HA feather 

  ```bash
  [root@node3 /mnt/sqlha_ag 10:57]# docker-compose up -d
  [root@node3 /mnt/sqlha_ag 10:57]# docker-compose ps
    Name                Command               State                                         Ports
  --------------------------------------------------------------------------------------------------------------------------------------
  sqlNode1   /bin/sh -c /opt/mssql/bin/ ...   Up      0.0.0.0:1401->1433/tcp,:::1401->1433/tcp, 0.0.0.0:1521->5022/tcp,:::1521->5022/tcp
  sqlNode2   /bin/sh -c /opt/mssql/bin/ ...   Up      0.0.0.0:1402->1433/tcp,:::1402->1433/tcp, 0.0.0.0:1522->5022/tcp,:::1522->5022/tcp
  sqlNode3   /bin/sh -c /opt/mssql/bin/ ...   Up      0.0.0.0:1403->1433/tcp,:::1403->1433/tcp, 0.0.0.0:1523->5022/tcp,:::1523->5022/tcp
  ```

- Create the certs ,master key and logins on each nodes [create_cert_all.sh](SQL_AG_Docker/create_cert_all.sh)
- Sync all certs to each other [sync_all.sh](SQL_AG_Docker/sync_all.sh)
- Create AG group and Endpoint on Primary Node [create_ag_primary.sh](SQL_AG_Docker/create_ag_primary.sh)
- Two Secondary nodes join AG group  [join_ag_sec.sh](SQL_AG_Docker/join_ag_sec.sh)
- Create TestDB and add TestDB to AG [create_TAGDB.sh](SQL_AG_Docker/create_TAGDB.sh)
- Change roles on each node to test  [change_primary_to_node2.sh](SQL_AG_Docker/change_primary_to_node2.sh)

