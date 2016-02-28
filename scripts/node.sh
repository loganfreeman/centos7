#!/usr/bin/env bash

echo "Installing NodeJS (CentOS method)"

curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -

yum -y install nodejs

# install build tools for nodejs
yum install -y gcc-c++ make

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
