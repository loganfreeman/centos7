#!/bin/sh

# create our development directory
DEVDIR=/usr/local/dev
PYTHON_DEV_DIR=$DEVDIR/python
mkdir -p $DEVDIR
mkdir -p $DEVDIR/python
rsync /vagrant/* $DEVDIR

# enable the Extra Packages for Enterprise Linux (EPEL) repository
echo "Enabling Extra Packages for Enterprise Linux (EPEL) repository..."
yum -y -q install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# enable Red Hat Software Collections (SCL) for the latest python and postgresql and more
echo "Enabling Red Hat Software Collections (SCL) repository..."
yum -y -q install centos-release-SCL

# install python 3 and add it to the environment paths
echo "Installing Python 3..."
yum -y -q install python33 python33-devel python33-python-virtualenv python33-python-psycopg2
source /opt/rh/python33/enable

# initialize the directory to contain our python packages
echo "Building virtualenv containing Python modules..."
virtualenv -q --system-site-packages $PYTHON_DEV_DIR
cd $PYTHON_DEV_DIR && source bin/activate
pip install ipython gunicorn django mod_wsgi --quiet

# fix the file permissions
chown -R vagrant.vagrant $DEVDIR

# set a login message and done
mv -f $DEVDIR/motd /etc/
echo "DONE"
