Vagrant.configure("2") do |config|

	config.vm.define :proxy do |proxy|
	  proxy.vm.box = "centos/7"
	  proxy.vm.provider :libvirt do |domain|
	        domain.memory = 1024
	        domain.cpus = 1
			proxy.vm.network :private_network, :ip =>'10.143.20.2'
			config.vm.provision "shell", path: "proxy.sh"
		end
		config.vm.provider :libvirt do |libvirt|
			libvirt.driver = "kvm"
			libvirt.connect_via_ssh = false
		end
	end
	config.vm.define :web do |web|
		web.vm.box= "centos/7"
		web.vm.provider "libvirt" do |domain|
			domain.memory = 1024
			domain.cpus = 1
			web.vm.network :private_network, :ip =>'10.143.20.3'
			config.vm.provision "shell", path: "web.sh"
		end
		config.vm.provider :libvirt do |libvirt|
			libvirt.driver = "kvm"
			libvirt.connect_via_ssh = false
		end
	end
	config.vm.define :db do |db|
		db.vm.box= "centos/7"
		db.vm.provider "libvirt" do |domain|
			domain.memory = 1024
			domain.cpus = 1 
			db.vm.network :private_network, :ip => '10.143.20.4'
			config.vm.provision "shell", path: "db.sh"
		end
		config.vm.provider :libvirt do |libvirt|
			libvirt.driver = "kvm"
			libvirt.connect_via_ssh = false
		end
	end
	config.vm.define :monitor do |monitor|
		monitor.vm.box="centos/7"
		monitor.vm.provider "libvirt" do |domain|
			domain.memory = 1024
			domain.cpus = 1
			monitor.vm.network :private_network, :ip => '10.143.20.5'
			config.vm.provision "shell", path: "monitor.sh"
		end
		config.vm.provider :libvirt do |libvirt|
			libvirt.driver = "kvm"
			libvirt.connect_via_ssh = false
		end
	end
end
