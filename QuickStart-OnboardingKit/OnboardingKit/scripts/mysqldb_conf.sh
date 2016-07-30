#!/bin/sh

# PetClinic Db creation script

MyUSER="$1"
MyPASS="$2"

sudo mysqladmin -u root password $MyPASS

C1="CREATE DATABASE IF NOT EXISTS petclinic;"
C2="USE petclinic;"
C3="GRANT ALL PRIVILEGES ON *.*  TO '$MyUSER'@'%' IDENTIFIED BY '$MyPASS' WITH GRANT OPTION;"
C4="FLUSH PRIVILEGES;"
SQL="${C1}${C2}${C3}${C4}"

sudo mysql -h localhost "--user=$MyUSER" "--password=$MyPASS" -Bse "$SQL"

exit 0
