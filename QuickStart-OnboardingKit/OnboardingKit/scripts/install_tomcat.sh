#!/bin/sh

#Install script for tomcat 7

INSTALL_PATH="$1"

sudo tar xvzf apache-tomcat-7.0.56.tar.gz
if [ $? != 0 ];then echo "Unable to extract tar file."; exit 100; fi
sudo mv apache-tomcat-7.0.56 $INSTALL_PATH
if [ $? != 0 ];then echo "Unable to move tar file '${INSTALL_PATH}'."; exit 100; fi
sudo ${INSTALL_PATH}/bin/startup.sh
if [ $? != 0 ];then echo "Unable to start tomcat."; exit 100; fi

exit 0

# Leave the last line empty, otherwise it can cause problems running the script
