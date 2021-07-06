Vagrant.configure("2") do |config|

  config.vm.provision "shell", path: "setup.sh"

  config.vm.define "node1" do |node1|
    node1.vm.box = "centos/stream8"
    node1.vm.box_url = "centos/stream8"
    node1.vm.hostname = "node1"

    node1.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/kube-setup.yml"
      ansible.extra_vars = {
        node1ip: "192.168.56.10",
        node2ip: "192.168.56.11",
        node3ip: "192.168.56.12",
        node1name: "node1",
        node2name: "node2",
        node3name: "node3",
        mode: "master"
      }
    end

    node1.vm.network :private_network, ip: "192.168.56.10"
    node1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2560]
      v.customize ["modifyvm", :id, "--name", "node1"]
      v.cpus = 2
    end
  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "centos/stream8"
    node2.vm.box_url = "centos/stream8"
    node2.vm.hostname = "node2"

    node2.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/kube-setup.yml"
      ansible.extra_vars = {
        node1ip: "192.168.56.10",
        node2ip: "192.168.56.11",
        node3ip: "192.168.56.12",
        node1name: "node1",
        node2name: "node2",
        node3name: "node3",
        mode: "worker"
      }
    end

    node2.vm.network :private_network, ip: "192.168.56.11"
    node2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1560]
      v.customize ["modifyvm", :id, "--name", "node2"]
      v.cpus = 2
    end
  end


  config.vm.define "node3" do |node3|
    node3.vm.box = "centos/stream8"
    node3.vm.box_url = "centos/stream8"
    node3.vm.hostname = "node3"

    node3.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/kube-setup.yml"
      ansible.extra_vars = {
        node1ip: "192.168.56.10",
        node2ip: "192.168.56.11",
        node3ip: "192.168.56.12",
        node1name: "node1",
        node2name: "node2",
        node3name: "node3",
        mode: "worker"
      }
    end

    node3.vm.network :private_network, ip: "192.168.56.12"
    node3.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1560]
      v.customize ["modifyvm", :id, "--name", "node3"]
      v.cpus = 2
    end
  end

end
