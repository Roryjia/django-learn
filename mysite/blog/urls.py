# -*-coding:utf-8 -*-
# 
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-12-12, by rory
# 
# 

__author__ = 'rory'

from django.conf.urls import url, patterns

from .views import Index, DivTest

urlpatterns = patterns('',
    url('^index/?', Index.as_view(), name='index'),
    url('^div/test/?', DivTest.as_view(), name='div_test'),
    )