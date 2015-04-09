#!/usr/bin/python
#!coding=utf-8

from company.models import Company
from company.forms import CompanyForm
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.conf import settings
import os
from django.http import HttpResponseRedirect
from util import log
import logging
from django.contrib.sessions.backends.db import SessionStore

@csrf_exempt
def edit_company(request):
    """
    @param request:
    @return:
    """
    form = CompanyForm()
    if request.method == "POST":
        form = CompanyForm(request.POST, request.FILES)
        if form.is_valid():
            com = form.cleaned_data
            name = com["name"]
            addr = com["addr"]
            site = com["site"]
            logo_name = com["logo"].name
            logo_file = com["logo"].file
            d_file = os.path.abspath(settings.MEDIA_ROOT).replace("\\", "/") + "/" + logo_name
            try:
                company = Company()
                company.name = name
                company.addr = addr
                company.site = site
                company.logo = com["logo"]
                company.save()
            except Exception, e:
                log.error_log(e.message)
                return e.message
            # str = "<br/>".join([i for i in dir(com["logo"])])
            # return HttpResponse(str)
        return HttpResponseRedirect("/company/show/?name="+com["name"])
    from .forms import PostAdminForm
    form1 = PostAdminForm()
    return render_to_response("edit_company.html", {"form": form, 'form1': form1 , "base": settings})


def show_company(request):
    result = Company.objects.all()
    name = ""
    if request.method == "GET":
        for r in result:
            logger = logging.getLogger('info')
            logger.info(r.name + ' ' + r.site + ' ' + r.addr)
        if "name" in request.GET:
            name = request.GET["name"]
    return render_to_response("show_company.html", {"result": result, "name": name, "base": settings})


from django.views.generic import ListView
class ShowCompany(ListView):
    model = Company

