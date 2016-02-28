#!/bin/sh

# create our development directory
DEVDIR=/usr/local/dev
mkdir -p $DEVDIR
rsync /vagrant/* $DEVDIR

# install Nginx
echo "Installing Nginx..."
yum -y -q install nginx
mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig
mv $DEVDIR/nginx-dev.conf /etc/nginx/conf.d/
service nginx start
chkconfig nginx on
