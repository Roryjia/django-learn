# -*-coding:utf-8 -*-
__author__ = 'zhongjie.jia'


from django.forms import ModelForm, Textarea
from .models import Author, Book


class AuthorForm(ModelForm):
    class Meta:
        model = Author
        fields = ('name', 'title', 'birth_date')
        widgets = {
            'name': Textarea(attrs={'cols': 80, 'rows': 20})
        }


class BookForm(ModelForm):
    class Meta:
        model = Book
