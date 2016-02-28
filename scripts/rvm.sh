function command_exists () {
    type "$1" &> /dev/null ;
}

function installQtWebkit() {
  if command_exists qmake; then
    echo "qmake already installed"
  else
    echo "install qtwebkit-devel"
    yum install -y qtwebkit-devel
    test -L /usr/bin/qmake || ln -s /usr/lib64/qt4/bin/qmake /usr/bin/qmake
  fi
}

function installDev() {
  echo "install httpd-devel mysql-devel"
  yum install -y httpd-devel mysql-devel
}

if command_exists rvm; then
  echo "rvm already installed"
else
  echo "install rvm"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  source /etc/profile.d/rvm.sh
  rvm list | grep ruby-2.1.5 || rvm install 2.1.5
  rvm use 2.1.5 --default
  gem install bundler
fi

installQtWebkit
installDev
