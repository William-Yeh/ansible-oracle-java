Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  #config.vm.box = "hashicorp/precise64"
  #config.vm.box = "chef/centos-6.5"
  #config.vm.box = "chef/debian-7.4"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "test.yml"
    ansible.sudo = true
  end
end
