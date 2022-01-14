# SQL Server AG with 3 Nodes on Docker
---
## Steps
- Prepare the Dockerfile with HA feather
- Build image with Dockerfile just created
- Create the SQL server nodes with the image which with HA feather
- Create the certs ,master key and logins on each nodes
- Sync all certs to each other
- Create AG group and Endpoint on Primary Node
- Two Secondary nodes join AG group
- Create TestDB and add TestDB to AG
- Change roles on each node to test

