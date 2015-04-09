__author__ = 'LB14010015-STAFF'
from dev import *

CACHES = {
    "default": {
        "BACKEND": "redis_cache.cache.RedisCache",
        "LOCATION": "127.0.0.1:6379:1",
        "OPTIONS": {
            "CLIENT_CLASS": "redis_cache.client.DefaultClient",
        }
    }
}

CKEDITOR_UPLOAD_PATH = os.path.join(os.path.dirname(__file__), '../../media/uploads/').replace('\\','/')

# STATIC_ROOT = ''
# STATICFILES_DIRS = (
#     '../static/',
# )