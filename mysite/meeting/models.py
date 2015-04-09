#!/usr/bin/python
#!coding=utf-8
from django.db import models
from company.models import Company


class Meeting(models.Model):
    theme = models.CharField(u"会议主题", max_length=50)
    m_time = models.DateTimeField(u"会议时间")
    company = models.ManyToManyField(Company, verbose_name=u"参会公司")
    addr = models.CharField(u"会议地点", max_length=50)

    def __unicode__(self):
        return self.theme

    class Meta:
        verbose_name = u"会议信息"
        verbose_name_plural = u"会议信息"