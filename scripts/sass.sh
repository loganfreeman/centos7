#!/usr/bin/env bash

echo "Installing SASS 3.4.10"

echo "#!/usr/bin/env bash" > /etc/profile.d/local-bin.sh
echo "pathmunge /usr/local/bin after" >> /etc/profile.d/local-bin.sh

gem install -N sass
echo "Installed SASS version: `/usr/local/bin/sass -v`"

echo "Installing Compass"
gem install -N compass
# needed to compile core sass
gem install -N compass-colors
echo "Compass installed `/usr/local/bin/compass -v`"
