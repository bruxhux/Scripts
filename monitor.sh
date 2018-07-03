#!/bin/bash

yum -y update
yum -y install httpd
firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload
systemctl start httpd
sudo systemctl enable httpd