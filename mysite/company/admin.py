#!/usr/bin/python
#!coding=utf-8
__author__ = 'LB14010015-STAFF'

from django.contrib import admin
from company.models import Company, Post
from forms import PostAdminForm


def get_logo(obj):
    get_logo.allow_tags = True
    return '<img src="%s" />' % obj.logo.url
get_logo.short_description = u'公司LOGO'


# class ContentInline(admin.StackedInline):
#     model = Post
#     extra = 2


class CompanyAdmin(admin.ModelAdmin):
    list_display = ('name', 'addr', 'site', get_logo)
    search_fields = ("name",)
    fieldsets = [
        (None, {'fields': ['name', 'addr', 'site']}),
        (u'公司LOGO', {'fields': ['logo'], 'classes': ['collapse']}),
    ]
    # inlines = [ContentInline, ]



def get_content(obj):
    get_content.allow_tags = True
    return obj.content
get_content.short_description = u'内容'


class PostAdmin(admin.ModelAdmin):
    form = PostAdminForm

    list_display = (get_content, 'content', )




admin.site.register(Post, PostAdmin)
admin.site.register(Company,CompanyAdmin)