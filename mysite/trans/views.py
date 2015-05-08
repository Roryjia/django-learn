# -*-coding:utf-8 -*-
# 
# Copyright (C) 2012-2015 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2015-04-26, by rory
# 
# 

__author__ = 'rory'

from django.utils.translation import ugettext as _
from django.http import HttpResponse
from django.views.generic import TemplateView

from util import log
from mixins import BaseView


def trans_hello(request):
    output = _('Welcome to my site')
    # output = _(u'欢迎来到我的网站')

    # log.info_log(u'测试 翻译的文本')
    # print dir(request)
    # print request.META.keys()
    # print request.META.items()
    response = HttpResponse(output)
    response['Accept-Language'] = 'ZH-CN'
    return response


class TransHello(TemplateView):
    template_name = 'i18n-test.html'

    def get(self, request, *args, **kwargs):
        # from django.utils import translation
        # translation.activate('en')
        # request.session[translation.LANGUAGE_SESSION_KEY] = 'en'
        return super(TransHello, self).get(request, *args, **kwargs)