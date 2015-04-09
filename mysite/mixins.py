# -*-coding:utf-8 -*-
# 
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-12-12, by rory
# 
#
from django.template import RequestContext

__author__ = 'rory'

import json

from django.shortcuts import render_to_response
from django.views.generic import View
from django.http import HttpResponse


class BaseView(View):
    """
    返回json/html的基础view
    """

    def response_json(self, status=0, message='', data=None):
        result = {
            'status': status,
            'message': message or '',
            'data': data or {}
        }
        return HttpResponse(json.dumps(result), mimetype='application/json')

    def response_html(self, html_template, context):
        return render_to_response(html_template, context, context_instance=RequestContext(self.request))

    def get(self, request):
        return super(BaseView, self).get(request)

    def post(self, request, *args, **kwargs):
        return super(BaseView, self).post(request, *args, **kwargs)