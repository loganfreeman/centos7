#!/bin/sh

function manual_install_py() {
  wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
  tar xf Python-2.7.3.tar.bz2
  cd Python-2.7.3
  ./configure --prefix=/usr/local
  make && make altinstall
}

# create our development directory
DEVDIR=/usr/local/dev
PYTHON_DEV_DIR=$DEVDIR/python
mkdir -p $DEVDIR
mkdir -p $DEVDIR/python

yum -y install scl-utils
yum install -y python-devel  python-lxml graphviz 
rpm -Uvh https://www.softwarecollections.org/en/scls/rhscl/python33/epel-7-x86_64/download/rhscl-python33-epel-7-x86_64.noarch.rpm
yum -y install python33 # python version 3.3
scl enable python33 bash
python -V # 3.3
easy_install pip

# initialize the directory to contain our python packages
echo "Building virtualenv containing Python modules..."
virtualenv -q --system-site-packages $PYTHON_DEV_DIR
cd $PYTHON_DEV_DIR && source bin/activate
pip install ipython gunicorn django mod_wsgi --quiet

echo "DONE"
