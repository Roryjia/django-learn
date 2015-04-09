#!/usr/bin/python
#!coding=utf-8
from django import forms
from models import Company, Post
from django.contrib.admin.widgets import AdminDateWidget
from ckeditor.widgets import CKEditorWidget


class CompanyForm(forms.Form):
    name = forms.CharField(label=u"公司名称", max_length=30)
    addr = forms.CharField(label=u"公司地址", max_length=50)
    logo = forms.ImageField(label=u"公司LOGO", )
    site = forms.URLField(label=u"公司网址", )
    time = forms.CharField(label=u'公司成立时间', widget=AdminDateWidget)
    # time = forms.DateField(u'公司成立时间')


class CompayForm1(forms.ModelForm):

    class Meta:
        model = Company
        fields = ('name', 'addr', 'logo', 'site')


class PostAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget)

    class Meta:
        model = Post

if __name__ == "__main__":
    cform = CompanyForm()
    print cform.as_table()