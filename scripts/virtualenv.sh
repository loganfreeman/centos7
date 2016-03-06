function install-virtualenv() {
  # Install virtualenv and virtualenvwrapper
  # Once you make your first virtualenv, you'll have 'pip' in there.
  # I got bitten by trying to install a system-wide (i.e. Python 2.6) version of pip;
  # it was clobbering my access to pip from within virtualenvs, and it was frustrating.
  # So these commands will install virtualenv/virtualenvwrapper the old school way,
  # just so you can make yourself a virtualenv, with pip, and then do everything Python-related
  # that you need to do, from in there.
  wget --no-check-certificate https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.1.tar.gz#md5=07e09df0adfca0b2d487e39a4bf2270a
  tar -xvzf virtualenv-1.9.1.tar.gz
  python virtualenv-1.9.1/setup.py install
  wget --no-check-certificate https://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-4.0.tar.gz#md5=78df3b40735e959479d9de34e4b8ba15
  tar -xvzf virtualenvwrapper-*
  python virtualenvwrapper-4.0/setup.py install
  echo 'export WORKON_HOME=~/Envs' >> $HOME/.bashrc # Change this directory if you don't like it
  source $HOME/.bashrc
  mkdir -p $WORKON_HOME
  echo '. /usr/bin/virtualenvwrapper.sh' >> $HOME/.bashrc
  source $HOME/.bashrc
}
