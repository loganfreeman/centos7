echo "install mongodb"
yum install -y mongodb-org
service mongod start
chkconfig mongod on
