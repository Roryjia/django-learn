#!/usr/bin/python
# -*-coding:utf-8 -*-
__author__ = "LB14010015-STAFF"

from django.contrib import admin
from person.models import Person, Card, Author, Book


class PersonAdmin(admin.ModelAdmin):
    list_display = ("name", "phone", "company", "mail")
    search_fields = ("name", )
    ordering = ("-age", )

admin.site.register(Person, PersonAdmin)
admin.site.register(Card)
admin.site.register(Author)
admin.site.register(Book)


from django.contrib.admin import AdminSite


# class MyAdminSite(AdminSite):
#     site_header