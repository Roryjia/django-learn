# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-08-22, by zhongjie.jia
#
#
#!/usr/bin/python
#!coding=utf-8
# import xadmin
#
# __author__ = 'LB14010015-STAFF'
# from company.models import Company, Post
# from forms import PostAdminForm
#
#
# def get_logo(obj):
#     get_logo.allow_tags = True
#     return '<img src="%s" />' % obj.logo.url
# get_logo.short_description = u'公司LOGO'
#
#
# # class ContentInline(admin.StackedInline):
# #     model = Post
# #     extra = 2
#
#
# class CompanyAdmin(object):
#     list_display = ('name', 'addr', 'site')
#     search_fields = ("name",)
#     fieldsets = [
#         (None, {'fields': ['name', 'addr', 'site']}),
#         (u'公司LOGO', {'fields': ['logo'], 'classes': ['collapse']}),
#         ]
#     # inlines = [ContentInline, ]
#
#
# def get_content(obj):
#     get_content.allow_tags = True
#     return obj.content
# get_content.short_description = u'内容'
#
#
# class PostAdmin(object):
#     form = PostAdminForm
#     list_display = ('content', )
#
#
# xadmin.site.register(Post, PostAdmin)
# xadmin.site.register(Company,CompanyAdmin)