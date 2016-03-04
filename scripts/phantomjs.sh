if ! test -L /usr/local/bin/phantomjs; then
  DIR=`pwd`
  cd /usr/local/share
  wget https://phantomjs.googlecode.com/files/phantomjs-1.8.2-linux-i686.tar.bz2
  tar xvf phantomjs-1.8.2-linux-i686.tar.bz2
  rm phantomjs-1.8.2-linux-i686.tar.bz2
  ln -s /usr/local/share/phantomjs-1.8.2-linux-i686/bin/phantomjs /usr/local/bin/phantomjs
  cd "${DIR}" 
fi
