import sys, os
cwd = os.getcwd()
sys.path.append(cwd)
sys.path.append(cwd + '/<module>')  #You must add your project here or 500

#Switch to new python
#You may try to replace $HOME with your actual path
if sys.version < "2.7.3": os.execl("<project_dir>/env/bin/python",
 "python2.7.3", *sys.argv)

sys.path.insert(0,'<project_dir>/env/bin')
sys.path.insert(0,'<project_dir>/env/lib/python2.7/site-packages/django')
sys.path.insert(0,'<project_dir>/env/lib/python2.7/site-packages')

os.environ['DJANGO_SETTINGS_MODULE'] = "<module>.settings"
# python < 1.7
# import django.core.handlers.wsgi
# application = django.core.handlers.wsgi.WSGIHandler()
# Python 1.7
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
