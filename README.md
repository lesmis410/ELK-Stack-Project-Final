This repository is a collection of .yml playbooks used during an ELK Stack deployment (2), diagrams to illustrate networks in the cloud (2), and basic Linux scripts (2).
ELK-Stack

This repo contains the ELK stack project conducted as part of Columbia Cybersecurity Bootcamp. It explores the deployment, purpose, and resources used to created the ELK stack.
Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below. Images/Project1_4_diagram

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Playbook file may be used to install only certain pieces of it, such as Filebeat.

/images/Project1_3_playbook.png

This document contains the following details:

    Description of the Topology
    Access Policies
    ELK Configuration
        Beats in Use
        Machines Being Monitored
    How to Use the Ansible Build

Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting traffic to the network.

    What aspect of security do load balancers protect? What is the advantage of a jump box? The LB protects the availability of data, ensuring that traffic is spread evenly so as not to overwhelm the servers. The advantage of a jumpbox is that it is liminal,

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the machine and system logs.

    What does Filebeat watch for? Filebeat collects files about the data system, especially for modifications on the data system.
  What does Metricbeat record? Metricbeats collects machine metrics, such as the uptime that a machine has or CPU usage.

The configuration details of each machine may be found below.
Name 	Function 	IP Address 	Operating System
Jump Box 	Gateway 	10.0.0.5 	Linux
DVWA-1 	VM 	10.0.0.6 	Linux
DVWA-2 	VM 	10.0.0.9 	Linux
ELK-1 	ELK Server 	10.1.0.5 	Linux
Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 73.0.246.93

Machines within the network can only be accessed by the Jumbox and the ELK server.

A summary of the access policies in place can be found in the table below.
Name 	Publicly Accessible 	Allowed IP Addresses
RedTeam 	Yes 	73.0.246.93 (local)
DVWA-1 	No 	10.0.0.5
DVWA-2 	No 	10.0.0.5
Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

   What is the main advantage of automating configuration with Ansible? The main advantage of automating configuration is that it is standardized across the resource group, as well as for future configurations.

The playbook implements the following tasks:

   In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.

    Create a service VM for the ELK server
    In the Ansible container, create a playbook that installs Docker and run it on specified machines (i.e. elkservers).
    This playbook must install docker.io, python.pip, and docker. Lastly, it must install the container image sepb/elk. The container must open with these port mappings: 5601:5601, 9200:9200, 5044:5044. 4)Launch the container to ensure that it is working.
    Restrict access to the ELK server by whitelisting the local host to its incoming rules, then open Kibana through http://[public IP]:5601

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance /images/Project1_5_dockerPS.png
Target Machines & Beats

This ELK server is configured to monitor the following machines:

  10.0.0.6 and 10.0.0.9

We have installed the following Beats on these machines: Metricbeat and Filebeat

These Beats allow us to collect the following information from each machine:

 Metricbeat: Metricbeat collects metrics, or measurement aspects of a system such as the uptime or the CPU usage of a machine. Filebeat: Filebeat is a “lightweight” log shipper that supports large amounts of data consumption. It is better at parsing information than Logstash but cannot replace it. Filebeat keeps the state of files (using Harvesters) to know if files were renamed or modified.

Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

    Copy the configuration file (i.e. metricbeat.yml) file to /etc/(ie. metricbeat).
    Update the host file to include the IP address of the ELK server.
    Run the playbook, and navigate to the /etc/(i.e. filebeat) to check that the installation worked as expected.

Answer the following questions to fill in the blanks:

    _Which file is the playbook? Where do you copy it? The playbook is my-playbook .yml file, and is copied to the /etc/ansible directory.
    _Which file do you update to make Ansible run the playbook on a specific machine? /etc/ansible/hosts
    How do I specify which machine to install the ELK server on versus which to install Filebeat on?_To install ELK server create a group in the hosts file titled [elkservers] and to install Filebeat, the filebeat configuration file (i.e. filebeat.yml) must specify under elasticsearch.output and setup.kibana to use the public IP of the ELK server with the suffix :9200 and :5601, respectively.
    _Which URL do you navigate to in order to check that the ELK server is running? http://[public IP]:5601
