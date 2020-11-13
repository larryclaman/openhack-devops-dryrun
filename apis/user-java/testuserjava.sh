#!/bin/bash


export SQL_USER="demousersa" 
export SQL_PASSWORD="demo@pass123" 
export SQL_SERVER="openhack8pm8c3y5sql.database.windows.net" 
export SQL_DBNAME="mydrivingDB"

docker run -p 8080:8080 \
    -e SQL_USER -e SQL_PASSWORD -e SQL_SERVER -e SQL_DBNAME \
    javaf
