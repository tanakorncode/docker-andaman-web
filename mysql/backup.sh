#!/bin/bash
NOW=$(date +"%m-%d-%Y_%H-%M")
FILE="backup-$NOW.sql.gz"
docker exec lemp_mariadb sh -c 'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --databases $MYSQL_DATABASE | gzip' > "$(pwd)/backup/$FILE"
echo "Backing up data complate."
