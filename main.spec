Name:		main
Version:	1
Release:	1
Summary:	aplicatia main
License: 	FIXME

%description
Primul rmp pentru aplicatia main

%prep

%build
./build.sh

%install
mkdir -p %{buildroot}/opt/go-interns/
mkdir -p %{buildroot}/opt/go-interns/templates/
mkdir -p %{buildroot}/etc/systemd/system
install -m 755 main %{buildroot}/opt/go-interns/main
install -m 755 templates/* %{buildroot}/opt/go-interns/templates/
install -m 755 conf.json %{buildroot}/opt/go-interns/conf.json
install -m 755 go-interns.service %{buildroot}/etc/systemd/system/

%files
/opt/go-interns/main
/etc/systemd/system/go-interns.service
/opt/go-interns/templates/*
/opt/go-interns/conf.json

%post
/ser/bin/getend passwd gouser || /usr/sbin/useradd -r -d /opt/go-interns/main -s /sbin/nologin gouser
systemctl daemont-reload
systemctl start go-interns.service
systemctl enable go-interns.service


%changelog
