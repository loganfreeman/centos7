# install postgresql 9, set the environment paths and create a dev database
# note that we set paths because the scl command is not script or su friendly
echo "Installing PostgreSQL 9..."
yum -y -q install postgresql94-server
service postgresql-9.4 initdb
service postgresql-9.4 start
systemctl enable postgresql
source /opt/rh/postgresql94/enable
cd /
su postgres -c 'createuser vagrant'
su postgres -c 'createdb dev --owner vagrant'
