#!/bin/sh
docker service create --name mssql -d -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=SqlDevOps2017" -e "MSSQL_PID=Developer" -p 1433:1433 microsoft/mssql-server-linux:latest
