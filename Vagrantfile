# -*- mode: ruby -*-
Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-nocm"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  [0, 1, 2].each do |i|
    config.vm.define "node#{i}" do |its|
      its.vm.network "private_network", ip: "192.168.50.20#{i}"
    end
  end
end
