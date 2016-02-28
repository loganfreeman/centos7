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
