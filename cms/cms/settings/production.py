from .base import *

DEBUG = False

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '2hq&h!h8bk)yfz5(9m*-734q%l&n*$&2^vu3z8j&_&=izmo&m%'

# SECURITY WARNING: define the correct hosts in production!
ALLOWED_HOSTS = ['digital-crisis.tools', 'www.digital-crisis.tools', 'localhost'] 

try:
    from .local import *
except ImportError:
    pass
