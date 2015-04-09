#!/usr/bin/python
#!coding=utf-8
__author__ = "LB14010015-STAFF"

import re
from django import template
register = template.Library()


@register.filter
def lower(value):
    return value.lower()


@register.filter
def strip(value):
    return re.sub(r"[*&$#@!\s]", "", value)


@register.tag
def get_current_time(parser, token):
    try:
        tag_name, format_string = token.split_contents()
    except:
        msg = "%r tag requires a single argument" % token.split_contents()[0]
        raise template.TemplateSyntaxError(msg)
    return CurrentTimeNode(format_string[1:-1])


class CurrentTimeNode(template.Node):
    def __init__(self, format_string):
        self.format_string = format_string

    def render(self, context):
        import datetime
        now = datetime.datetime.now()
        return now.strftime(self.format_string)


@register.tag
def set(parser, token):
    try:
        tag_name, key, value = token.split_contents()
    except:
        msg = "%r tag requires a single argument" % token.split_contents()[0]
        raise template.TemplateSyntaxError(msg)
    return SetParm(key, value)


class SetParm(template.Node):
    def __init__(self, key, value):
        self.key = key
        self.value = value

    def render(self, context):
        context[self.key] = self.value
        return ""

