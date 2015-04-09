#!/usr/bin/python
#!coding=utf-8
from django.db import models


class Company(models.Model):
    name = models.CharField(u"公司名称", max_length=30)
    addr = models.CharField(u"公司地址", max_length=50)
    logo = models.ImageField(u"公司LOGO", upload_to='.')
    site = models.URLField(u"公司网站")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"公司信息"
        verbose_name_plural = u"公司信息"

from ckeditor.fields import RichTextField


class Post(models.Model):
    content = RichTextField()
