#About this repo

This repo contains **scripts** to stand up **HPE Codar Community Edition (HPE Codar CE) on Docker containers**. 

HPE Codar CE contains components such as **Core Codar** running in a JBoss container, **HPE Operation Orchestration Community Edition (HP OO CE) Central Server** running on a Tomcat server and Codar, HP OO and IDM **databases** created using PostgreSQL Server. 

All these **three components** will be made available on **three Docker containers** and yet connected to each other to form a single portal service.

#Concepts
HPE Codar is a **DevOps automation** tool primarily focuses on **release pipeline automation**. 

This community edition of Codar helps the community users to automate deployment of complex application on a hybrid cloud environment and also it helps to **automate “Continuous Deployment and Continuous Delivery”** process. 

•	Automation includes **infrastructure** provisioning, **platform software** installation or configuration, **deployment of application** on complex environment like load balancer etc. 

•	Automate the end-to-end steps of your applications deployment by integrating with various **resource providers** like **VMWare vCenter, AWS, OpenStack, Docker etc. and import the intelligence from HP OO, Chef,		Puppet and HP SA** etc. to install or configure software and deploy application. 

•	Allows to create **blueprints/designs** using **rich graphical designer (drag & drop)**, trigger deployments using native UI or auto-deploy using **CI tool like Jenkins, Bamboo** etc. which helps for **Continuous		Deployment**.


#Advantages you get when using HPE Codar CE

•	**Ease of automation**. Supports HPE OO CE which is  the native automation tool which helps the end user to automate any complex steps. It contains 6000+ pre-created automated operations and workflows which can be		leveraged to automate the installation of software and deployment application from day1. 

•	**Integration with third party products** like **vCenter, AWS, OpenStack, Docker, Chef, Puppet and Mesosphere** etc. SDK to integrate with home grown products or any third party products

•	**20+ integration with HP Software products like HPE Sitescope, HPE Application Lifecycle Management HPE Helion Development Platform, HPE Stackato, HPE Oneview etc.**

•	Build **Cloud Agnostic blueprints** to deploy the application across different cloud vendor

•	Build **Cloud Native blueprints** to make the application components deployed as “micro-services”

•	Supports **northbound interface**

•	Complete **release gating automation** with **built-in approval mechanism**

•	**In-built versioning system** for application blue-prints and components

•	Heavy lifting is already done by the proven software **HP OO which acts as a central engine**

•	**Authentication & Authorization** supports CAC, SSO, LDAP etc.

•	**RBAC** support



#HPE Codar CE trial license limitions
1.	30 days of trial period with unlimited deployment on any number of OSI
2.	Post trail period only 5 OSI can be used

#Codar version supported
```
Codar 1.60
```

#Prerequisites 
1.	Set up Docker client with “docker-compose” as given in this  Docker site. [Reference Site](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
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
	•	curl -k -L https://github.com/HewlettPackard/codar-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin <hostname> <ipaddress>
 
  Please replace the arguments as per the below instruction,
  <hostname> is the Docker workstation/client hostname
  <ipaddress> is the Docker workstation/client ipaddress

  For example, the Curl command should be as below. The hostname and ipaddress are sample
  curl -k -L https://github.com/HewlettPackard/codar-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin mydockerclient.mydomain.com 10.1.1.12

  Please always stop or start the containers using below commands,
  To stop: docker-compose stop
  To start: docker-compose up --no-recreate -d
  (Kindly note that docker-compose start is currently not supported)
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


#Documents
1.	[Concepts Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.6_ConceptsGuide.pdf)
2.	[Help Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_Help.pdf)
3.	[Configuration Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_ConfigurationGuide.pdf)
4.	[API Reference Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_API_ReferenceGuide.pdf)
5.	[QuickStart Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.6_QuickStartGuide.pdf)
6.	[3rd Party License Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_OS-3rdPty-License.pdf)


#Important notes

• Please read through the Codar install and configure guide for post installation steps. For example, do remember to change in the OO Central server, 
	Content Management --> Configuration Items --> System Properties --> CSA_REST_URI

• HPSSO/LWSSO is not enabled. Please refer the help guide to configure HPSSO/LWSSO. Please note that, "ipaddress" is used to configure CSA/Codar

• Codar & OO are connected by Docker client machine IP with external port

• The scripts which helps for configuring the Codar will be available at the /tmp location of all the containers (please reach out to us for any enhancement on these scripts).

• Any capsule content upload which is new can be done within Docker Codar container and no extra configurations are required. The content zip file location should be mentioned in the
	/usr/local/hp/csa/Tools/CSLContentInstaller/silent_install.xml. 
	For Codar, please use silent_install_codar.xml, incase if you have installed Codar license

#Known Issues
For product known issues, please refer Codar 1.60 Release Notes [here](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_ReleaseNotes.pdf).

#License
View [license](https://github.com/HewlettPackard/codar-ce/blob/master/LICENSE) information for the software contained in this repo.

#Issues
If you have any problems with or questions about the software contained in this repo, please write us to tech-ambassadors-capu@hpe.com or [GitHub issue](https://github.com/HewlettPackard/codar-ce/issues).
