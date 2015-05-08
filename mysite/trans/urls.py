# -*-coding:utf-8 -*-
# 
# Copyright (C) 2012-2015 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2015-04-26, by rory
# 
# 

__author__ = 'rory'

from django.conf.urls import patterns, url

from .views import trans_hello, TransHello


urlpatterns = patterns('',
    # url(r'^hello/?$', trans_hello, name='trans_hello'),
    url(r'^hello/?$', TransHello.as_view(), name='trans_hello'),
    )