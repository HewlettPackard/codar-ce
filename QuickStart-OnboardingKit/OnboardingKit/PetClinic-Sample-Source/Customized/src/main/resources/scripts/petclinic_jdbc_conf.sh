#!/bin/sh
mkdir /tmp/arm-workdir
mv /tmp/petclinic.war /tmp/arm-workdir/petclinic.zip
mkdir /tmp/arm-workdir/petclinic
unzip /tmp/arm-workdir/petclinic.zip -d /tmp/arm-workdir/petclinic

mv /tmp/arm-workdir/petclinic/WEB-INF/classes/jdbc.properties jdbc.tmp

sed -e s/127.0.0.1/$1/g jdbc.tmp > jdbc.tmp1
sed -e s/root/$2/g jdbc.tmp1 > jdbc.tmp2
sed -e s/ubuntu/$3/g jdbc.tmp2 > jdbc.tmp

mv -f jdbc.tmp /tmp/arm-workdir/petclinic/WEB-INF/classes/jdbc.properties
mv -f /tmp/arm-workdir/petclinic/WEB-INF/classes/jdbc.properties /tmp/arm-workdir/petclinic/WEB-INF/classes

#rm -f jdbc.tmp*

mv /tmp/arm-workdir/WEB-INF/lib/mysql-connector-java-5.1.15-bin.jar /tmp/arm-workdir/petclinic/WEB-INF/lib
cd /tmp/arm-workdir/petclinic
zip -r /tmp/arm-workdir/petclinic-updated.zip ./*
mv /tmp/arm-workdir/petclinic-updated.zip /tmp/arm-workdir/petclinic.war
sudo mv /tmp/arm-workdir/petclinic.war $4/webapps

sudo service tomcat7 restart
exit 0


