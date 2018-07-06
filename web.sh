#!/bin/bash

yum -y update
yum -y install git
yum -y install golang

git clone https://github.com/aso930/go-interns.git
cd /home/vagrant/go-interns/
./build.sh
cat <<EOF > conf.json
{
	"DBName": "2018",
	"user": "postgres",
	"Password": "postgres",
	"Host": "10.143.20.4",
	"Port": "5432"
}
EOF
cd /etc/systemd/system/

cat <<EOF > go-interns.service
{
	[Unit]
	Description=go-interns-main

	[Service]
	ExecStart=/home/vagrant/go-interns/main
	WorkingDirectory=/home/vagrant/go-interns
	KillMode=process
	Type=simple
	StandardError=syslog
	StandardOutput=syslog
	SyslogIdentifier=syslog

	[Install]
	WantedBy=default.target

}
EOF
