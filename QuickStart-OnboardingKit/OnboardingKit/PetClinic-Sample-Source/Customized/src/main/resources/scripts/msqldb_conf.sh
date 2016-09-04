#!/bin/sh
MyUSER="$1"
MyPASS="$2"

sudo mv /etc/mysql/my.cnf my.cnf.in
sudo sed -e s/127.0.0.1/0.0.0.0/g my.cnf.in | sudo tee /etc/mysql/my.cnf
#sudo rm -f my.cnf.in

sudo /etc/init.d/mysql restart
#service mysql restart

#mysql -h localhost "--user=$MyUSER" "--password=$MyPASS" -Bse "CREATE DATABASE IF NOT EXISTS testdb;"

C1="CREATE DATABASE IF NOT EXISTS petclinic;"
C2="USE petclinic;"
C3="GRANT ALL PRIVILEGES ON *.*  TO '$MyUSER'@'%' IDENTIFIED BY '$MyPASS' WITH GRANT OPTION;"
C4="FLUSH PRIVILEGES;"
SQL="${C1}${C2}${C3}${C4}"


#mysql -h localhost "--user=$MyUSER" "--password=$MyPASS" -Bse "GRANT ALL ON testdb TO $MyUSER@'localhost' IDENTIFIED BY $MyPASS WITH GRANT OPTION;"
#mysql -h localhost "--user=$MyUSER" "--password=$MyPASS" -Bse "FLUSH PRIVILEGES;"

sudo mysql -h localhost "--user=$MyUSER" "--password=$MyPASS" -Bse "$SQL"

exit 0


