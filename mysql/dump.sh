#!/bin/bash
docker exec -i lemp_mariadb mysql -uroot -proot_db --database=queue < /home/tanakornphompak/docker/mysql/backup/queue.sql