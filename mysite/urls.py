#!/usr/bin/python
#!coding=utf-8
from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings
admin.autodiscover()
from views import ShowParm, TestDispatch

# django test
from django.core.urlresolvers import reverse
#反转URL匹配的    reverse('URL_NAME', args=(URL_PARM,))
from django.views.static import serve
from django.http import Http404
# import xadmin
# xadmin.autodiscover()


js_info_dict = {
    'packages': ('trans',),
}

urlpatterns = patterns('',
    # url(r'^xadmin/', include(xadmin.site.urls), name='xadmin'),
    url(r"^admin/", include(admin.site.urls)),
    url(r'^ckeditor/', include('ckeditor.urls')),
    url(r"^company/", include("company.urls")),
    url(r"^blog/", include("blog.urls")),
    url(r"^testStatic/$", "views.show_static"),
    url(r"^test_parm/(?P<parm>[^/]*)/$", ShowParm.as_view()),
    url(r"^testParm/(?P<parm>[^/]+)/$", "views.show_parm"),
    url(r"^show_csv/$", "views.show_csv"),
    url(r"^testFile/$", "views.testFile"),
    url(r"^testQR/$", "views.qr"),
    url(r"^test_EncodeAES/$", "views.test_EncodeAES"),
    url(r"^test_DecodeAES/$", "views.test_DecodeAES"),
    url(r"^test_DecodeAES_Java/$", "views.test_DecodeAES_Java"),
    url(r"^test_DecodeAES_File/$", "views.test_DecodeAES_File"),
    url(r"^test_dispatch/(\w+)/?$", TestDispatch.as_view(), name='test-dispatch'),


    url(r"^trans/", include("trans.urls")),
    url(r'^jsi18n/$', 'django.views.i18n.javascript_catalog', js_info_dict),
    url(r'^i18n/', include('django.conf.urls.i18n')),
)

if settings.DEBUG:
    urlpatterns += patterns("",
                            url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                                {'document_root': settings.MEDIA_ROOT}
                            ),
    )