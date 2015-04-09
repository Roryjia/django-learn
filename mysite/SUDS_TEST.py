# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-08-26, by rory
#
#

__author__ = 'rory'
import suds
import logging

# Send log messages to console
logging.basicConfig(level=logging.INFO)
# Set Suds logging level to debug, outputs the SOAP messages.
logging.getLogger('suds.client').setLevel(logging.DEBUG)

# from suds.transport.https import HttpAuthenticated
# transport = HttpAuthenticated(username='username', password='password')
# 需要进行身份验证

from django.conf import settings

TEST_WSDL_API = 'http://webservice.webxml.com.cn/WebServices/MobileCodeWS.asmx?wsdl'


class WSDL(object):
    def __init__(self, api=''):
        self.url = api or settings.WSDL_API_URI

    def _get_client(self):
        try:
            return suds.client.Client(self.url)
        except Exception, e:
            print 'Exception , %s' % e
        return None

    def direct_request(self, method_name, kw):
        client = self._get_client()
        if not client:
            return False, u'连接WSDL URL出错'
        if not hasattr(client.service, method_name):
            return False, u'该WebService没有这个%s方法.' % method_name
        try:
            if isinstance(kw, list) or isinstance(kw, tuple):
                result = getattr(client.service, method_name)(*kw)
            elif isinstance(kw, dict):
                result = getattr(client.service, method_name)(**kw)
            else:
                result = getattr(client.service, method_name)(kw)
            return True, result
        except Exception, e:
            print 'Exception , %s' % e
            return False, u'请求API %s出错' % method_name

if __name__ == '__main__':
    wsdl = WSDL(TEST_WSDL_API)
    parm = {'mobileCode': '13917974506'}
    method = 'getMobileCodeInfo'
    re = wsdl.direct_request(method, parm)
    print 'Flag: ', re[0]
    print 'Result: ', re[1]

