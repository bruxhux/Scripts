#!/bin/bash

yum -y update
yum -y install nano
yum -y install epel-release
yum -y install nginx
systemctl start nginx
systemctl enable nginx
cd /etc/nginx/
cat <<EOF > conf.d{
	location /go-interns {
		proxy_pass http://10.143.20.3:18080
	}
}
EOF
systemctl restart nginx
systemctl enable nginx