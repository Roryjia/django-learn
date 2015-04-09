#!/usr/bin/python
#!coding=utf-8
__author__ = "LB14010015-STAFF"

from django.contrib import admin
from meeting.models import Meeting


class MeetingAdmin(admin.ModelAdmin):
    list_display = ("theme", "addr", "m_time")
    search_fields = ("theme",)
    ordering = ("m_time",)


admin.site.register(Meeting, MeetingAdmin)