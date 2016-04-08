#About this repo

This repo contains scripts to stand up HPE Codar Community Edition (HPE Codar CE) on Docker containers. HPE Codar CE contains components such as Core Codar running in a JBoss container, HPE Operation Orchestration Community Edition (HP OO CE) Central Server running on a Tomcat server and Codar, HP OO and IDM databases created using PostgreSQL Server. All these three components will be made available on a Docker container using this script and yet connected to each other to form a single portal service of release automation.

#What is HPE Codar CE?
HPE Codar is a DevOps automation tool primarily focuses on release pipeline automation. This community edition of Codar helps the community users to automate deployment of complex application on a hybrid cloud environment and also it helps to automate “Continuous Deployment and Continuous Delivery” process. 
•	Automation includes infrastructure provisioning, platform software installation or configuration, deployment of application on complex environment like load balancer etc. 
•	Automate the end-to-end steps of your applications deployment by integrating with various resource providers like VMWare vCenter, AWS, OpenStack, Docker etc. and import the intelligence from HP OO, Chef, Puppet, HP		SA etc. to install or configure software and deploy application. 
•	Allows to create blueprints/designs using rich graphical designer (drag & drop), trigger deployments using native UI or auto-deploy using CI tool like Jenkins, Bamboo etc. which helps for Continuous Deployment.

#What is HPE OO CE (HP OO CE)?
HPE OO CE is a workflow automation tool which helps the end user to automate any complex steps. It contains 6000+ pre-created automated operations and workflows which can be leveraged to automate the installation of software and deployment application from day1. 

#Limitations of HPE Codar CE
1.	30 days of trial period with unlimited deployment on any number of OSI
2.	Post trail period only 5 OSI can be used
3.	HP Operations Orchestration has the limitation on # of executions

#Codar version supported
```
Codar 1.60
```

#Why CSA/Codar on Docker?

•  All the “Goodness” of Docker will be available for CSA too, like lightweight, reduce the application component dependencies, portability/supportability and help for quick deployment.

•  Easy to use for  PoC or for demos.

•  Adhere to latest technology as the customer shifting their platform to adopt Docker platform.

•  Pre-baked application components will avoid the installation time and avoid any installation issue.


#Prerequisites 
1.	Set up Docker client with “docker-compose” as given in this  Docker site. [Link](https://rndwiki.corp.hpecorp.net/confluence/display/rndapps/HP+Docker+Registry+for+HPE)
2.	OS & System Requirements for Docker Client/Workstation
```
OS  : Ubuntu 12.x and above
HDD : 40GB 
RAM : 8GB 
CPU : 4
```

#Instructions to stand up HPE Codar CE 1.60

```

1.	Login to the registry docker.io with your username, password and email 
	Command to execute: docker login docker.io
2.	Command to execute:
(If you are not creating a folder under /tmp, please make sure there is no docker-compose.yml exists in the directory before you execute the curl command to stand up CSA/Codar"

•	mkdir /tmp/codar
•	cd /tmp/codar 
•	curl -k -L https://github-is-p.ghe.hos.hpecorp.net/raw/alex-william/cloud-orchestrate-csa/master/Codar1.6/buildEnv-dockercompose.sh | bash /dev/stdin <hostname> <ipaddress>
 
  Please replace the arguments as per the below instruction,
  <hostname> is the Docker workstation/client hostname
  <ipaddress> is the Docker workstation/client ipaddress

  For example, the Curl command should be as below. The hostname and ipaddress are sample
  curl -k -L https://github-is-p.ghe.hos.hpecorp.net/raw/alex-william/cloud-orchestrate-csa/master/Codar1.6/buildEnv-dockercompose.sh | bash /dev/stdin mydockerclient.mydomain.com 10.1.1.12

  Please always stop or start the containers using below commands,
  To stop: docker-compose stop
  To start: docker-compose up --no-recreate -d
  (Kindly note that docker-compose start is currently not supported)
```

Scripts/Files

```
	https://github-is-p.ghe.hos.hpecorp.net/raw/alex-william/cloud-orchestrate-csa/master/Codar1.6/buildEnv-dockercompose.sh
	https://github-is-p.ghe.hos.hpecorp.net/raw/alex-william/cloud-orchestrate-csa/master/Codar1.6/docker-compose.yml

```

#Codar Endpoints
Please find the exposed ports from which you can access various portals of Codar
```
	Codar Management Console - https://<dockerworkstaions_ip>:18444/csa

	Credentials 	
	Username: admin
	Password: cloud

	Operations Orchestration Central - https://<dockerworkstaions_ip>:18445/oo
	
	Credentials 
	Username: admin
	Password: cloud	
```

#Important notes

• Please read through the Codar install and configure guide for post installation steps. For example, do remember to change in the OO Central server, 
	Content Management --> Configuration Items --> System Properties --> CSA_REST_URI

• HPSSO/LWSSO is not enabled. Please refer the help guide to configure HPSSO/LWSSO. Please note that, "ipaddress" is used to configure CSA/Codar

• Codar & OO are connected by Docker client machine IP with external port

• The scripts which helps for configuring the Codar will be available at the /tmp location of all the containers (please reach out to us for any enhancement on these scripts).

• Any capsule content upload which is new can be done within Docker CSA container and no extra configurations are required. The content zip file location should be mentioned in the
	/usr/local/hp/csa/Tools/CSLContentInstaller/silent_install.xml. 
	For Codar, please use silent_install_codar.xml, incase if you have installed Codar license

#Known Issues
For product known issues, please refer Codar 01.60 Release Notes

#License
View [license](https://github-is-p.ghe.hos.hpecorp.net/alex-william/cloud-orchestrate-csa/blob/master/LICENSE) information for the software contained in this repo.

#Issues
If you have any problems with or questions about the software contained in this repo, please write us to tech-ambassadors-capu@hpe.com or [GitHub issue](https://github-is-p.ghe.hos.hpecorp.net/alex-william/cloud-orchestrate-csa/issues).
