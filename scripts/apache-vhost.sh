#!/bin/bash
# Apache VirtualHost Template with variable replacement

if [ $# -lt 2 ]; then
  echo "Usage: $(basename $0) user domain" >&2
  exit 1
fi

site="$1"
domain="$2"
path="/vagrant/projects/$site"
template="/etc/httpd/sites-available/${domain}.conf"
cp /vagrant/template/apache-template.conf $template


if [ ! -d "$path" ]; then
  echo "Web directory $path doesn’t exists" >&2
  exit 2
fi

if [ ! -f "$template" ]; then
  echo "Template $template doesn’t exists" >&2
  exit 2
fi

# Escape slashes
doc_root=$(echo "$path" | sed 's/\//\\\//g');

sed -e "s/{DOMAIN}/$domain/g" -e "s/{DOC_ROOT}/$doc_root/g" -e "s/{DOMAIN}/$domain/g" $template
chmod 600 $template
