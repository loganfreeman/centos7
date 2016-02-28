#!/bin/sh

# create our development directory
DEVDIR=/usr/local/dev
PYTHON_DEV_DIR=$DEVDIR/python
mkdir -p $DEVDIR
mkdir -p $DEVDIR/python

yum -y install scl-utils
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
