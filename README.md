#About this repo

This repo contains **scripts** to stand up **HPE Codar Community Edition (HPE Codar CE) on Docker containers**. 

HPE Codar CE contains components such as **Core Codar** running in a JBoss container, **HPE Operation Orchestration Community Edition (HPE OO CE) Central Server** running on a Tomcat server and HPE Codar and IDM **databases** created using PostgreSQL Server. 

All these **three components** will be made available on **three Docker containers** and yet connected to each other to form a single portal service.

#Concepts
HPE Codar is a **DevOps automation** tool primarily focuses on **release pipeline automation**. 

This community edition of Codar helps the community users to automate deployment of complex application on a hybrid cloud environment and also it helps to **automate �Continuous Deployment and Continuous Delivery�** process. 

�	Automation includes **infrastructure** provisioning, **platform software** installation or configuration, **deployment of application** on complex environment like load balancer etc. 

�	Automate the end-to-end steps of your applications deployment by integrating with various **resource providers** like **VMWare vCenter, AWS, OpenStack, Docker, etc. and import the intelligence from HP OO, Chef,		Puppet and HP SA** etc. to install or configure software and deploy application. 

�	Allows to create **blueprints/designs** using **rich graphical designer (drag & drop)**, trigger deployments using native UI or auto-deploy using **CI tool like Jenkins, TFS, Bamboo** etc. which helps for **Continuous		Deployment**.

�	Release pipeline automation help you to configure gate actions to execute operations like test suite execution using native ALM integration or suite created using third party testing tool, approval and any third party
	software operation invocation.



#Advantages you get when using HPE Codar CE

�	**Ease of automation**. Supports HPE OO CE which is  the native automation tool which helps the end user to automate any complex steps. It contains 6000+ pre-created automated operations and workflows which can be		leveraged to automate the installation of software and deployment application from day1. 

�	**Integration with third party products** like **vCenter, AWS, OpenStack, Docker Engine, Docker UCP, Docker Cloud, Chef, Puppet and Mesosphere** etc. SDK to integrate with home grown products or any third party products

�	**20+ integration with HP Software products like HPE Sitescope, HPE Application Lifecycle Management, HPE Stackato, HPE Oneview etc.**

�	Build **Cloud Agnostic blueprints** to deploy the application across different cloud vendor

�	Build **Cloud Native blueprints** to make the application components deployed as �micro-services�

�	Supports **northbound interface**

�	Complete **release gating automation** with **built-in approval mechanism**

�	**In-built versioning system** for application blue-prints and components

�	Heavy lifting is already done by the proven software **HP OO which acts as a central engine**

�	**Authentication & Authorization** supports CAC, SSO, LDAP, SAML etc.

�	**RBAC** support



#HPE Codar CE trial license limitations
1.	Trial period of 30 days with unlimited deployment for any number of OSI.
2.	After expiry of trial period upto 5 OSI will be  available if collection of product usage data by HPE is not selected during product activation.
3.	Upto 25 OSI will be available if collection of product usage data by HPE is selected during product activation.

#Codar version 
```
Codar 1.70
```

# Prerequisites 
1.	Set up Docker client with �docker-compose� latest version as given in this  Docker site. [Reference Site : Install Docker Engine](https://docs.docker.com/engine/installation/linux/ubuntulinux/) [Reference Site : Install Docker Compose] (https://docs.docker.com/compose/install/)
2.	OS & System Requirements for Docker Client/Workstation
```
OS  : Ubuntu 12.x and above
HDD : 40GB 
RAM : 8GB 
CPU : 4
```

```
Please do not pull the "codar" image directly as it will not stand up the complete HPE Codar product.

The "codar" image has dependency  over other images hosted in �useitwithcsacodar� repository for example PostgreSQL database and HPE Operations Orchestration CE.

Follow the instructions given in the �Instructions to launch HPE Codar CE 1.70 � below in order to smoothly stand up HPE Codar 1.70 product. 

You can also refer the �docker-compose.yml� file hosted in the �GitHub� to stand up the product. 
```


# Instructions to launch HPE Codar CE 1.70

```
Commands to execute:
(If you are not creating a folder under /tmp, please make sure there is no docker-compose.yml exists in the directory before you execute the curl command to stand up HPE Codar CE"

	�	mkdir /tmp/codar-ce
	�	cd /tmp/codar-ce 
	�	curl -k -L https://github.com/HewlettPackard/codar-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin <hostname> <ipaddress> [<proxyhost>] [<proxyport>]

 Proxyhost and Proxyport arguments are optional if the container already have internet access.
 This proxy setting will be used to connect the licensing server over internet. Provide the proxy server details if your container is running behind a firewall.

  Please replace the arguments as per the below instruction,
  <hostname> is the Docker workstation/client hostname
  <ipaddress> is the Docker workstation/client ipaddress
  <proxyhost>  proxy host 
  <proxyport>  proxy port 

 
  For example, the Curl command should be as below. The hostname and ipaddress are sample
  curl -k -L https://github.com/HewlettPackard/codar-ce/raw/master/buildEnv-dockercompose.sh | bash /dev/stdin mydockerclient.mydomain.com 10.1.1.12 web-proxy.mydomain.com 8080

  Please always stop or start the containers using below commands,
  To stop: docker-compose stop
  To start: docker-compose up --no-recreate -d
  (Kindly note that docker-compose start is currently not supported)
```

# HPE Codar CE endpoints
Please find the exposed ports from which you can access various portals of HPE Codar CE
```
	HPE Codar CE Management Console - https://<dockerworkstations_ip>:18444/csa

	Credentials 	
	Username: admin
	Password: cloud
	
	Operations Orchestration Central - https://<dockerworkstations_ip>:18445/oo
	
	Credentials 
	Username: admin
	Password: cloud	
```
Important Note : Please change the password after HPE Codar CE & HP OO CE are up and running

#Documents
The following documentation from the Codar 1.70 full release version is available for your reference:

1.	[Concepts Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_Concepts_Guide.pdf)

2.	[Help Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_Online_Help.pdf)

3.	[Configuration Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_Configuration_Guide.pdf)

4.	[API Reference Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_API_Reference_Guide)

5.	[QuickStart Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_Quick_Start_Guide.pdf)

6.	[3rd Party License Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_OS_3rdPty_Licenses.pdf)

7.	[Jenkins-ALM Configuration Guide] (https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_Jenkins_ALM-1.7.pdf)


#Important notes

� Please read through the Codar install and configure guide for post installation steps. 

  Important for Jenking-HPE Codar CE integration

	1. Launch  HPE OO CE Central portal https://<dockerworkstaions_ip>:18445/oo   --> content Management  -->  System Accounts --> CODAR_REST_CREDENTIALS --> provide �admin� as username and �cloud� password

	2. Go to HPE OO CE https://<dockerworkstaions_ip>:18445/oo --> content Management  --> System Properties --> CODAR_REST_API --> Replace localhost:8444 with  �<<Dockerhost>>:18444� value  

� HPSSO/LWSSO is not enabled. Please refer the help guide to configure HPSSO/LWSSO. Please note that, "ipaddress" is used to configure HPE Codar CE

� HPE Codar CE & HPE OO CE are connected by Docker client machine IP with external port

� The scripts which helps for configuring the Codar will be available at the /tmp location of all the containers (please reach out to us for any enhancement on these scripts).

� Any capsule content upload which is new can be done within Docker Codar container and no extra configurations are required. The content zip file location should be mentioned in the

	/usr/local/hpe/codar/Tools/CSLContentInstaller/silent_install.xml. 

	For Codar please use silent_install_codar.xml incase if you have installed Codar license

#Jenkins Docker custom container configuration  
 Use  �docker-compose.yml.jenkins� (remove .jenkins extension) to download Jenkins pre-configured with PetClinic sample app. 

	1. Please modify the proxy information from /opt/apache-maven-2.2.1/conf/settings.xml inside the Jenkins Docker container and update proxy under Jenkins --> Manage Plugins --> Advanced --> Proxy Configuration

	2. Codar �cacerts� will be available once the Codar Docker containers are up and running. Go in to Codar container and copy "cacerts" from Codar container from the location "/usr/local/hpe/codar/openjre/lib/security/cacerts" to /share

		# docker exec -it codar /bin/bash
		Inside the container run the below command
		# cd /usr/local/hpe/codar/openjre/lib/security/
		# cp /usr/local/hpe/codar/openjre/lib/security/cacerts /share
		# exit
		Exit from the container

	3. Go in to Jenkins container and copy /share/cacerts to /tmp/cacerts location

		#  docker exec -it <jenkins container id> /bin/bash
		Inside the container run the below command
		# cp /share/cacerts /tmp/cacerts
		# exit
		Exit from the container

	4. You need configure this cacerts location in the Jenkins-Codar plugin, so please take a note of this cacerts location present in Jenkins container which is /tmp/cacerts

	5. Go to Manage Jenkins Configure System Jenkins URL http://<<DOCKERHOST>>:18080/ and update the Docker host URL

	6. For any Jenkins error, please check /var/log/jenkins/jenkins.log

 Refer the [Jenkins-ALM Configuration Guide] (https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_Jenkins_ALM-1.7.pdf) to integrate Jenkins with Codar

# SVN info
To check out the SVN repo and you can use the same checked out directory to check-in designs. There is a �designs� folder which exists within this folder.
	http://<<DOCKERHOST:18081>>/svn/petclinic/branches/petclinic-sourcecode-1.60.0000 

	USERNAME  : admin

	PASSWORD  : admin


#Known issues
For product known issues, please refer Codar 1.70 Release Notes [here](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.70_Release_Notes.pdf).

#License
View [license](https://github.com/HewlettPackard/codar-ce/blob/master/LICENSE) information for the software contained in this repo.

#Issues
If you have any problems with or questions about the software contained in this repo, please write us to tech-ambassadors-capu@hpe.com or [GitHub issue](https://github.com/HewlettPackard/codar-ce/issues).
