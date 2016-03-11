function array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

function command_exists () {
    type "$1" &> /dev/null ;
}

function installPassenger() {
  if command_exists passenger-config; then
    passenger-config validate-install --auto
    if [ $? -eq 0 ]; then
      echo "Passenger is good"
      return 0
    fi
  fi
  echo "installing epel-release pygame curl"
  yum install -y epel-release pygpgme curl
  echo "Add our el7 YUM repository"
  curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
  echo "Installing Passenger + Apache module"
  yum install -y mod_passenger passenger-devel
  # restart Apache to ensure that Passenger is activated
  systemctl restart httpd
  passenger-config validate-install --auto
  if [ $? -eq 0 ]; then
    echo "Passenger is good"
    return 0
  fi
  return 1
}

function manual_install_passenger() {
  # manuall install using the following scripts
  gem install bundler --no-rdoc --no-ri
  gem install rails --no-rdoc --no-ri
  gem install rake --no-rdoc --no-ri
  gem install passenger
  yum install -y libcurl-devel
  passenger-install-apache2-module
  cp /vagrant/passenger.conf /etc/httpd/conf.modules.d
  passenger-config validate-install
}

manual_install_passenger
