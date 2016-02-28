# install postgresql 9, set the environment paths and create a dev database
# note that we set paths because the scl command is not script or su friendly
echo "Installing PostgreSQL 9..."
yum -y install postgresql-server postgresql-contrib
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql

#su postgres -c 'createuser vagrant'
#su postgres -c 'createdb dev --owner vagrant'
