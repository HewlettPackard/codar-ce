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



#HPE Codar CE trial license limitations
1.	30 days of trial period with unlimited deployment on any number of OSI
2.	Post trail period only 5 OSI can be used

#Codar version supported
```
Codar 1.60 with Patch 1
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

	Default Credentials 	
	Username: admin
	Password: cloud

	Operations Orchestration Central - https://<dockerworkstaions_ip>:18445/oo
	
	Default Credentials 
	Username: admin
	Password: cloud	
```
Important Note : Please change the password after HPE Codar CE & HP OO CE are up and running

#Documents
1.	[Concepts Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.6_ConceptsGuide.pdf)
2.	[Help Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_Help.pdf)
3.	[Configuration Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_ConfigurationGuide.pdf)
4.	[API Reference Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_API_ReferenceGuide.pdf)
5.	[QuickStart Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_1.6_QuickStartGuide.pdf)
6.	[3rd Party License Guide](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_OS-3rdPty-License.pdf)


#Important notes

• Please read through the Codar install and configure guide for post installation steps. 
  Important for Jenking-Codar integration
	1. Launch  HP OO Central portal (https://<dockerworkstaions_ip>:18445/oo)   --> content Management  -->  System Accounts --> CODAR_REST_CREDENTIALS --> provide “admin” as username and “cloud” password
	2. Go to HP OO (https://<dockerworkstaions_ip>:18445/oo) --> content Management  --> System Properties --> CODAR_REST_API --> Replace localhost:8444 with  “<<Dockerhost>>:18444” value  

• HPSSO/LWSSO is not enabled. Please refer the help guide to configure HPSSO/LWSSO. Please note that, "ipaddress" is used to configure CSA/Codar

• Codar & OO are connected by Docker client machine IP with external port

• The scripts which helps for configuring the Codar will be available at the /tmp location of all the containers (please reach out to us for any enhancement on these scripts).

• Any capsule content upload which is new can be done within Docker Codar container and no extra configurations are required. The content zip file location should be mentioned in the
	/usr/local/hp/csa/Tools/CSLContentInstaller/silent_install.xml. 
	For Codar, please use silent_install_codar.xml, incase if you have installed Codar license

#Jenkins Docker custom container configuration  
 Use  “docker-compose.yml.jenkins” (remove .jenkins extension) to download Jenkins pre-configured with PetClinic sample app. 

	1. Please modify the proxy information from /opt/apache-maven-2.2.1/conf/settings.xml inside the Jenkins Docker container and update proxy under Jenkins --> Manage Plugins --> Advanced --> Proxy Configuration

	2. Codar “cacerts” will be available once the Codar Docker containers are up and running. After you trigger the docker-compose.yml.jenkins (remove .jenkins extension) “cacerts” will be copied to “/share/cacerts” 
	using Docker volume

	3. You can configure this cacerts location in the Jenkins-Codar plugin

	4. Go to Manage Jenkins Configure System Jenkins URL http://<<DOCKERHOST>>:18080/ and update the Docker host URL

	5. For any Jenkins error, please check /var/log/Jenkins/ jenkins.log

# SVN Info
To check out the SVN repo and you can use the same checked out directory to check-in designs. There is a “designs” folder which exists within this folder.
	http://<<DOCKERHOST:18081>>/svn/petclinic/branches/petclinic-sourcecode-1.60.0000 

	USERNAME  : admin

	PASSWORD  : admin


#Known Issues
For product known issues, please refer Codar 1.60 Release Notes [here](https://github.com/HewlettPackard/codar-ce/raw/master/Docs/Codar_160_ReleaseNotes.pdf).

#License
View [license](https://github.com/HewlettPackard/codar-ce/blob/master/LICENSE) information for the software contained in this repo.

#Issues
If you have any problems with or questions about the software contained in this repo, please write us to tech-ambassadors-capu@hpe.com or [GitHub issue](https://github.com/HewlettPackard/codar-ce/issues).
