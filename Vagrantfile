Vagrant.require_version ">= 1.5"

require 'yaml'

CurrentDir = File.dirname(File.expand_path(__FILE__))
VagrantVariablesFileContent = YAML.load_file("#{CurrentDir}/VagrantVariables.yml")
VagrantVariables = VagrantVariablesFileContent['wk_box']

Vagrant.configure(2) do |config|

    #################################################################
    ## Base settings
    #################################################################
    config.vm.box = "centos/7"
    config.vm.box_check_update = false
    config.vm.hostname = VagrantVariables['server']['hostname']
    config.hostsupdater.aliases = VagrantVariables['server']['hostnames'].split(" ")

    #################################################################
    ## Networking & Syncing
    #################################################################
    config.vm.network :private_network, ip: VagrantVariables['ip']
    config.ssh.forward_agent = true

    config.vm.synced_folder '.', '/vagrant', :id => 'vagrant-root', :disabled => true
    config.vm.synced_folder VagrantVariables['sync_folder']['host'], VagrantVariables['sync_folder']['guest'],
        :nfs => true,
        :nfs_udp => true

    #################################################################
    ## Virtualbox settings
    #################################################################
    config.vm.provider :virtualbox do |v|
        v.name = VagrantVariables['hostname']
        v.customize [
            "modifyvm", :id,
            "--name", VagrantVariables['hostname'],
            "--memory", VagrantVariables['memory'],
            "--natdnshostresolver1", "on",
            "--cpus", 1,
        ]
    end

    #################################################################
    ## Provisioning - Ansible
    #################################################################
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision/playbook.yml"
    end

    #################################################################
    ## Provisioning - Restart apache when starting the machine (always).
    #################################################################
    config.vm.provision "shell", inline: "sudo service httpd restart", run: "always", keep_color: true

end
