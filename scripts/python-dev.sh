function install-py() {
  wget --no-check-certificate http://www.python.org/ftp/python/2.7.4/Python-2.7.4.tar.bz2
  tar xf Python-2.7.4.tar.bz2
  cd Python-2.7.4
  ./configure --prefix=/usr/local
  make && make altinstall
}

# Install development tools and some misc. necessary packages
yum -y groupinstall "Development tools"
yum -y install zlib-devel  # gen'l reqs
yum -y install bzip2-devel openssl-devel ncurses-devel  # gen'l reqs
yum -y install mysql-devel  # req'd to use MySQL with python ('mysql-python' package)
yum -y install libxml2-devel libxslt-devel  # req'd by python package 'lxml'
yum -y install unixODBC-devel  # req'd by python package 'pyodbc'
yum -y install sqlite sqlite-devel  # you will be sad if you don't install this before compiling python, and later need it.
