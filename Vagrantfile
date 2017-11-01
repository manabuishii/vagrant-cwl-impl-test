Vagrant.configure(2) do |config|
  #config.vm.box = "ubuntu/xenial64"
  config.vm.box = "bento/ubuntu-16.04"

  #config.vm.provider "virtualbox" do |vm|
  #  # 4GB memory
  #  vm.customize ["modifyvm", :id, "--memory", "4096"]
  #end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
