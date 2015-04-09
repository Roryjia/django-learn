#!/usr/bin/python
#!coding=utf-8
from django.conf.urls import patterns, include, url
from .views import ShowCompany

urlpatterns = patterns('',
                       url(r"^edit/$", "company.views.edit_company"),
                       url(r"^show/$", "company.views.show_company"),
                       url(r"^show_company/$", ShowCompany.as_view()),
                       )

