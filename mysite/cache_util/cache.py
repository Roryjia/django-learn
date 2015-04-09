#!/usr/bin/python
#!coding=utf-8
__author__ = 'LB14010015-STAFF'

from django.core.cache import cache
import logging
from django.contrib.sessions.middleware import SessionMiddleware

keys = cache.keys()
print keys
