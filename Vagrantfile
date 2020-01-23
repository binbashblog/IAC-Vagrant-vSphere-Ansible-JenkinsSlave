vm1 = { 'name' => "build-win1",'ip' => "10.0.0.52" }
vm2 = { 'name' => "build-win2",'ip' => "10.0.0.54" }
vm3 = { 'name' => "build-win3",'ip' => "10.0.0.56" }
vms = [ vm1, vm2, vm3]
 
Vagrant.configure(2) do |config|
config.vm.box				= "dummy"
    config.vm.box_url			= "dummy.box"  
config.vm.communicator			= "winrm" 
config.vm.boot_timeout			= 240
    config.vm.graceful_halt_timeout	= 240
    config.winrm.timeout		= 200
    config.winrm.username		= "Administrator"
    #config.winrm.password		= :ask
    config.winrm.password		= "CHANGEME"
    config.winrm.transport		= :plaintext
    config.winrm.basic_auth_only	= true
config.vm.synced_folder			".", "/vagrant", disabled: true

  vms.each do |node|
    vm_name				= node['name']
    vm_ip				= node['ip']
    config.vm.define vm_name do |node_config|
        #node_config.vm.network 'private_network', type: "dhcp"
        node_config.vm.network 'private_network', ip: vm_ip
	  #node_config.vm.provision		= :restart
        
  node_config.vm.provider :vsphere do |vsphere|
    	vsphere.host				= 'VC1'
        vsphere.compute_resource_name		= 'Build_VC'
        vsphere.name				= vm_name
        vsphere.customization_spec_name		= 'build'
        vsphere.template_name			= 'packer-templates/Win2016_Packer'
        vsphere.vm_base_path			= 'Vagrant'
        vsphere.user				= 'vagrant'
        #vsphere.password			= :ask
        vsphere.password			= 'CHANGEME'
        vsphere.insecure			= true
        vsphere.wait_for_sysprep		= true
        vsphere.notes				= 'deployed via vagrant'
        vsphere.cpu_count			= '4'
	vsphere.memory_mb			= '16384'
        #vsphere.vlan				= 'VM Network'
        end #end vsphere
        end #end node_config

  end #node


  config.vm.provision :ansible do | ansible| 
	ansible.playbook = "ansible/playbook.yml" 
    #	ansible.verbose = "vvv"
    	ansible.compatibility_mode="2.0"
  end #end ansible

end #end Vagrant.configure
