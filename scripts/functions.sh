function deploy() {
 site=$1
 if [ ! -f /etc/httpd/sites-available/${site}.conf ]; then
    echo "${site} not available"
    return
 fi

 rm -f /etc/httpd/sites-enabled/*.conf

 ln -s /etc/httpd/sites-available/${site}.conf /etc/httpd/sites-enabled/${site}.conf

 apachectl configtest

 service httpd restart
}


function setupVhost() {
  local DOMAIN=$1
  local DOCROOT=$2
  # create vhost

  grep "${DOMAIN}" /etc/hosts &>/dev/null || echo "127.0.0.1    ${DOMAIN}" >> /etc/hosts
  if [ ! -f "/etc/httpd/sites-available/${DOMAIN}.conf" ]; then
    cat <<EOF > "/etc/httpd/sites-available/${DOMAIN}.conf"
<VirtualHost *:80>
     ServerName ${DOMAIN}
     PassengerRuby /usr/local/rvm/wrappers/ruby-2.1.5/ruby
     PassengerAppEnv development
     ServerAdmin webmaster@${DOMAIN}
     DocumentRoot ${DOCROOT}/public
     <Directory ${DOCROOT}/public>
     Allow from all
     AllowOverride All
     Options -MultiViews
     Require all granted
     </Directory>
</VirtualHost>
EOF
  fi

  test -L "/etc/httpd/sites-enabled/${DOMAIN}.conf" || \
    ln -s "/etc/httpd/sites-available/${DOMAIN}.conf" "/etc/httpd/sites-enabled/${DOMAIN}.conf"
}
