yum install epel-release
yum update
yum --enablerepo=epel -y install mod_fcgid

# create execution environment
mkdir /var/www/html/fastcgi-bin

cp /usr/bin/php-cgi /var/www/html/fastcgi-bin/.

chown -R apache:apache /var/www/html/fastcgi-bin

chmod +x /var/www/html/fastcgi-bin/php-cgi
