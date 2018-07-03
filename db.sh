#!/bin/bash

yum -y update
yum -y install postgresql-server postgresql-contrib
systemctl start postgresql
systemctl enable postgresql