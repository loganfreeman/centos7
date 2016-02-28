# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #Vanilla
  config.vm.box = "bento/centos-7.1"

  # config.vbguest.auto_update = false

  config.vm.provider "virtualbox" do |v|
    # v.gui = true
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory
    if host =~ /darwin/
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024
    elsif host =~ /linux/
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i
    elsif host =~ /mswin|mingw|cygwin/
      # Windows code via https://github.com/rdsubhas/vagrant-faster
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end

    mem = mem / 1024 / 4
    v.customize ["modifyvm", :id, "--memory", mem]
  end
  # Required for NFS to work, pick any local IP
  # config.vm.network :private_network, ip: '192.168.50.50'
  # Use NFS for shared folders for better performance
  config.vm.synced_folder '.', '/vagrant'

  #---Networking---

  # Port forward 80 to 8080
  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 8081, host: 8081, auto_correct: true
  config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true
  config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true
  config.vm.network :forwarded_port, guest: 1080, host: 1080, auto_correct: true

  config.vm.network :forwarded_port, guest: 1090, host: 1090, auto_correct: true

  #Uncomment this if you want bridged network functionality
  #config.vm.network :public_network

  #Install lamp and so on
  #In future will probably swap this out with something like Puppet
  # config.vm.provision :shell, :path => "scripts/mount-webroot.sh"
  config.vm.provision :shell, :path => "scripts/php.sh", :args => "-v 5.6 -m 256 -t UTC"
  #config.vm.provision :shell, :path => "scripts/php-xhprof.sh"
  config.vm.provision :shell, :path => "scripts/composer.sh"
  #config.vm.provision :shell, :path => "scripts/install-silverstripe.sh", :args => "-v 3.x-dev"
  config.vm.provision :shell, :path => "scripts/apache.sh"
  config.vm.provision :shell, :path => "scripts/mariadb.sh"
  config.vm.provision :shell, :path => "scripts/rvm.sh"
  config.vm.provision :shell, :path => "scripts/install-passenger.sh"
  #config.vm.provision :shell, :path => "scripts/python.sh"
  config.vm.provision :shell, :path => "scripts/postgres.sh"
  #config.vm.provision :shell, :path => "scripts/mysql-57.sh"
  #config.vm.provision :shell, :path => "scripts/php-mcrypt.sh"
  config.vm.provision :shell, :path => "scripts/xdebug.sh"
  config.vm.provision :shell, :path => "scripts/ntp.sh"
  config.vm.provision :shell, :path => "scripts/node.sh"
  config.vm.provision :shell, :path => "scripts/bower.sh"
  config.vm.provision :shell, :path => "scripts/grunt.sh"
  #config.vm.provision :shell, :path => "scripts/grunt-watch.sh"
  config.vm.provision :shell, :path => "scripts/sass.sh"
  config.vm.provision :shell, :path => "scripts/less.sh"
  #config.vm.provision :shell, :path => "scripts/silverstripe-tasks.sh"
  #config.vm.provision :shell, :path => "scripts/sspak.sh"
  config.vm.provision :shell, :path => "scripts/mailcatcher.sh"
  config.vm.provision :shell, :path => "scripts/bootstrap.sh"
  config.vm.provision :shell, :path => "scripts/always.sh", run: "always"

end
