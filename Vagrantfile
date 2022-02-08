# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
    BOX_IMAGE = "hashicorp/precise64"
    BASE_NETWORK = "10.10.20"

    PROXY_HTTP = "http://10.0.2.2:5865"
    PROXY_HTTPS = "http://10.0.2.2:5865"
    PROXY_EXCLUDE = "localhost,127.0.0.1"

    BOX_CHK_UPDATE = false
    SSH_INSERT_KEY = false
    PROXY_ENABLE = true
    VB_CHK_UPDATE = false
     
    # VM web
    config.vm.define "web" do |webconfig|
        webconfig.vm.box = BOX_IMAGE
            webconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.10", virtualbox__intnet: true
        webconfig.vm.network "forwarded_port", guest: 80, host: 9080
         
        # proxy
        if PROXY_ENABLE == true
            if Vagrant.has_plugin?("vagrant-proxyconf")
                #print "setting proxy config"
                webconfig.proxy.http = PROXY_HTTP
                webconfig.proxy.https = PROXY_HTTPS
                webconfig.proxy.no_proxy = PROXY_EXCLUDE
            end
        end
        
        # guest addition
        if Vagrant.has_plugin?("vagrant-vbguest")
            webconfig.vbguest.auto_update = VB_CHK_UPDATE
        end
        
        webconfig.vm.box_check_update = BOX_CHK_UPDATE
        webconfig.ssh.insert_key = SSH_INSERT_KEY
        
        # vm info
        webconfig.vm.hostname = "mmweb.cpt.local"
        webconfig.vm.provider "virtualbox" do |vb|
            vb.name = "MMWeb"
            vb.memory = "1024"
            vb.cpus = 1
            #alter connection to the vm for more reliable boot
            vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
            vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
            #vb.gui = true #enable only for debugging
        end
        
        #provisioning
        webconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
        #webconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
      end


    # VM DB
    config.vm.define "db" do |dbconfig|
        dbconfig.vm.box = BOX_IMAGE
            dbconfig.vm.network "private_network", ip: "#{BASE_NETWORK}.15", virtualbox__intnet: true

        # proxy
        if PROXY_ENABLE == true
            if Vagrant.has_plugin?("vagrant-proxyconf")
                #only use with plugin vagrant-proxy
                #print "setting proxy config"
                dbconfig.proxy.http = PROXY_HTTP
                dbconfig.proxy.https = PROXY_HTTPS
                dbconfig.proxy.no_proxy = PROXY_EXCLUDE
            end
        end
        
        # guest addition
        if Vagrant.has_plugin?("vagrant-vbguest")
            dbconfig.vbguest.auto_update = VB_CHK_UPDATE
        end
        
        dbconfig.vm.box_check_update = BOX_CHK_UPDATE
        dbconfig.ssh.insert_key = SSH_INSERT_KEY
        
        # vm info
        dbconfig.vm.hostname = "mmdb.cpt.local"
        dbconfig.vm.provider "virtualbox" do |vb|
            vb.name = "MMDb"
            vb.memory = "1024"
            vb.cpus = 1
            #alter connection to the vm for more reliable boot
            vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
            vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
            #vb.gui = true #enable only for debugging
        end
        
        #provisioning
        dbconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
        #dbconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
    end
    
end

