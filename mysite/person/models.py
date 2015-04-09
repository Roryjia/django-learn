# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-10-08, by rory
#
#

from django.db import models
from company.models import Company

CARD_TYPE_CHOICES = (
    ('I', u'身份证'),
    ('T', u'驾照证'),
    ('B', u'银行证'),
)


class Card(models.Model):
    card_type = models.CharField(u"证件类型", max_length=20, choices=CARD_TYPE_CHOICES)
    card_num = models.CharField(u"证件号",  max_length=20, help_text=u"请输入正确的数字！",)

    def __unicode__(self):
        return "%s:%s" % (self.card_type, self.card_num)

    class Meta:
        verbose_name = u"证件信息"
        verbose_name_plural = u"证件信息"


class Person(models.Model):
    name = models.CharField(u"姓名", max_length=20)
    age = models.IntegerField(u"年龄")
    phone = models.CharField(u"手机号码", max_length=11)
    company = models.ForeignKey(Company, verbose_name=u"所属公司")
    mail = models.EmailField(u"邮箱地址")
    card = models.OneToOneField(Card, verbose_name="身份证件")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u"人员信息"
        verbose_name_plural = u"人员信息"

TITLE_CHOICES = (
    ('MR', 'Mr.'),
    ('MRS', 'Mrs.'),
    ('MS', 'Ms.'),
)


class Author(models.Model):
    name = models.CharField(u'姓名', max_length=100)
    title = models.CharField(u'主题', max_length=3, choices=TITLE_CHOICES)
    birth_date = models.DateTimeField(blank=True, null=True)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'作者'
        verbose_name_plural = u'作者'


class Book(models.Model):
    name = models.CharField(max_length=100)
    authors = models.ForeignKey(Author)

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'书'
        verbose_name_plural = u'书'
