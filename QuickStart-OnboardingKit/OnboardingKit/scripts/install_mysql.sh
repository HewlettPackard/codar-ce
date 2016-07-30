#!/bin/sh

#Install script for mysql database

export DEBIAN_FRONTEND=noninteractive

sudo groupadd mysql
sudo useradd -r -g mysql mysql
sudo tar xvf mysql-server_5.6.22-1ubuntu12.04_amd64.deb-bundle.tar
if [ $? != 0 ];then echo "Unable to extract tar file."; exit 100; fi

sudo dpkg -i mysql-common_5.6.22-1ubuntu12.04_amd64.deb
if [ $? != 0 ];then echo "Unable to install package mysql-common."; exit 100; fi

sudo dpkg -i mysql-community-server_5.6.22-1ubuntu12.04_amd64.deb
if [ $? != 0 ];then echo "Unable to install package mysql-community-server."; exit 100; fi

sudo dpkg -i mysql-community-client_5.6.22-1ubuntu12.04_amd64.deb
if [ $? != 0 ];then echo "Unable to install package mysql-community-client."; exit 100; fi

sudo mv /etc/mysql/my.cnf my.cnf.in
if [ $? != 0 ];then echo "Unable to move /etc/mysql/my.cnf."; exit 100; fi

sudo sed -e s/127.0.0.1/0.0.0.0/g my.cnf.in | sudo tee /etc/mysql/my.cnf
if [ $? != 0 ];then echo "Unable to configure my.cnf."; exit 100; fi

#sudo rm -f my.cnf.in

sudo /etc/init.d/mysql restart
if [ $? != 0 ];then echo "Unable to restart mysql server."; exit 100; fi

exit 0

# Leave the last line empty, otherwise it can cause problems running the script
