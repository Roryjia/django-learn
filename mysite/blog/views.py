# -*-coding:utf-8 -*-
# 
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-12-12, by rory
# 
#
from django.views.generic import TemplateView

__author__ = 'rory'

from mixins import BaseView


class Index(BaseView):
    def get(self, request):
        return self.response_html('index.html', {})


class DivTest(TemplateView):
    """
    div  盒子模型练习
    """
    template_name = 'div_test.html'