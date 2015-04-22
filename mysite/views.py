#!/usr/bin/python
#!coding=utf-8
from django.shortcuts import render_to_response, redirect
from django.conf import settings
from django.views.generic.detail import DetailView, SingleObjectMixin
from django.http import HttpResponse
import csv
from company.models import Company


def show_static(request):
    # return render_to_response("testStatic.html", {"base": settings})
    me = Company.objects.all()
    return redirect(me)


def show_parm(request, parm):
    return render_to_response("showParm.html", {"base": settings, "parm": parm})


def show_csv(request):
    response =  HttpResponse(content_type="text/csv")
    response["Content-Disposition"] = 'attachment; filename="some_filename.csv"'

    writer = csv.writer(response)
    writer.writerow(['First Row', 'Foo', 'Bar', 'Baz假正经'])
    writer.writerow(['Second Row', 'A', 'B', 'C', '"Testing"', "Here's a quote"])

    return response

from django.views.generic import TemplateView, FormView


class ShowParm(TemplateView):
    template_name = "showParm.html"

    def post(self, request, parm):
        print dir(request), parm

        return HttpResponse('')

    def get_context_data(self, **kwargs):
        context = super(ShowParm, self).get_context_data(**kwargs)
        context["base"] = settings
        context["parm"] = kwargs if kwargs.has_key("parm") and not kwargs["parm"] else kwargs["parm"]
        return context
    # def get(self, request, *args, **kwargs):
    #     if kwargs.has_key("parm") and not kwargs["parm"] == "":
    #         parm = kwargs["parm"]
    #     else:
    #         parm = kwargs
    #     context = {
    #         "base": settings,
    #         "parm": parm
    #     }
    #     return render_to_response(self.get_context_data(**context))


import json

class JsonResponse(HttpResponse):

    def __init__(self, msg='', status=1, data=None, *args, **kwargs):
        data = data or {}
        data['status'] = status
        if msg:
            data['msg'] = msg
        super(JsonResponse, self).__init__(json.dumps(data),
                                           mimetype='application/json',
                                           *args, **kwargs)

def testFile(req):
    print req.FILES
    images = dict(req.FILES).get('image')
    print type(images)
    for image in images:
        print image.content_type, image.field_name, image.name
    return JsonResponse(msg=u'xiao she ni hao a !!', status=1)


import qrcode, StringIO
def qr(req):
    result = u'xiao she zuo dishang '
    qr = qrcode.QRCode(version=5, box_size=10,
                       error_correction=qrcode.constants.ERROR_CORRECT_L)
    qr.add_data(result)
    qr.make(fit=True)
    img = qr.make_image()
    img_buffer = StringIO.StringIO()
    img.save(img_buffer)
    return HttpResponse(img_buffer.getvalue(), 'image/jpeg')

# from ASE import DecodeAES
# from ASE import EncodeAES
# from Crypto.Cipher import AES
# from Crypto import Random
# import json
# import os
from django.views.decorators.csrf import csrf_exempt
#
# secret_key = "MeZoneB_V3.0.0LB" * 2
# # secret = os.urandom(32)
# # print secret
# print secret_key
# secret_key_16 = "MeZoneB_V3.0.0LB"


class JsonResponse(HttpResponse):

    def __init__(self, msg='', status=1, secret_key='', data=None, *args, **kwargs):
        data = data or {}
        data['status'] = status
        if msg:
            data['msg'] = msg
        if secret_key:
            data['secret_key'] = secret_key
        super(JsonResponse, self).__init__(json.dumps(data),
                                           mimetype='application/json',
                                           *args, **kwargs)


@csrf_exempt
def test_EncodeAES(request):
    ctx = {}
    if request.method == 'GET':
        # cipher = AES.new(secret_key_16)
        test_json = {
            'a': u'hello 老杜',
            'b': [1, 3, u'小家']
        }
        test_string = 'hello'
        from AES_JAVA import AESCipher

        SECRET_KEY = "MeZoneB_V3.0.0LB"
        cipher = AESCipher(SECRET_KEY)
        encoded_string = cipher.encrypt(json.dumps(test_json))
        print encoded_string
        return JsonResponse(msg=encoded_string, status=1)


@csrf_exempt
def test_DecodeAES(request):
    # pass
    # import base64
    from AES_JAVA import AESCipher
    content = request.POST.get('content', '')
    SECRET_KEY = "MeZoneB_V3.0.0LB"
    cipher = AESCipher(SECRET_KEY)
    # base64_string = base64.b64encode(content)
    decode_content = cipher.decrypt(content)
    print decode_content
    return JsonResponse({'content': decode_content})


@csrf_exempt
def test_DecodeAES_Java(request):
    from AES_JAVA import AESCipher
    content = request.POST.get('content', '')
    print content
    SECRET_KEY = "MeZoneB_V3.0.0LB"
    cipher = AESCipher(SECRET_KEY)
    decode_content = cipher.decrypt(content)
    print decode_content
    json_content = json.loads(decode_content)
    print json_content['a']
    print json_content['b']
    return JsonResponse({'content': json_content})


@csrf_exempt
def test_DecodeAES_File(request):
    from AES_JAVA import AESCipher
    content = request.FILES.get('content', '')

    print content
    print '===========', type(content), dir(content)
    SECRET_KEY = "MeZoneB_V3.0.0LB"
    cipher = AESCipher(SECRET_KEY)
    import copy
    copy_file = copy.copy(content)
    print content.readlines()
    copy_file.writelines(cipher.decrypt(content.readlines()))
    # print decode_content
    # json_content = json.loads(decode_content)
    # print json_content['a']
    # print json_content['b']
    return JsonResponse({'content': copy_file})


from django.views.generic import View


class TestDispatch(View):
    """
    测试dispatch
    """
    def dispatch(self, request, *args, **kwargs):
        print args

        return super(TestDispatch, self).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        return HttpResponse('<h1>Hello Django View Dispatch</h1>')