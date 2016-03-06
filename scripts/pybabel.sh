git clone http://github.com/python-babel/babel.git
cd babel
virtualenv venv
. venv/bin/activate
python setup.py import_cldr
pip install --editable .
