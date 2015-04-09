# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-08-12, by zhongjie.jia
#
#
import json
import base64
from Crypto import Random
from Crypto.Cipher import AES


class AESCipher:
    def __init__(self, key):
        self.bs = AES.block_size
        self.key = key

    def encrypt(self, raw):
        raw = self._pad(raw)
        iv = Random.new().read(AES.block_size)
        cipher = AES.new(self.key, AES.MODE_CBC, iv)
        return base64.b64encode(iv + cipher.encrypt(raw))

    def decrypt(self, enc):
        enc = base64.b64decode(enc)
        iv = enc[:AES.block_size]
        cipher = AES.new(self.key, AES.MODE_CBC, iv)
        return self._unpad(cipher.decrypt(enc[AES.block_size:]))

    def _pad(self, s):
        # print 'length s : ', len(s)
        # print 'need padding: ', self.bs - len(s) % self.bs
        # print 'padding char: ', chr(self.bs - len(s) % self.bs), 'length:', len(chr(self.bs - len(s) % self.bs))
        return s + (self.bs - len(s) % self.bs) * chr(self.bs - len(s) % self.bs)

    def _unpad(self, s):
        return s[:-ord(s[len(s) - 1:])]

SECRET_KEY = "MeZoneB_V3.0.0LB"

if __name__ == '__main__':
    print '-=='
    a = 'hahhfafsssssssssssssssssssssssssssssasfasffkmq[owfmq[wkmfq[wkmf[qpwlkf,[qpwmf[qkwfm[qkwfm[qpkwmfq[kwmf[qkfwmq'
    test_json = {
        'a': u'hello 老杜',
        'b': [1, 3, u'小家']
    }
    cipher = AESCipher(SECRET_KEY)
    # en = cipher.encrypt(json.dumps(test_json))
    en = cipher.encrypt(a)
    print type(en), en
    print '=============='
    de = cipher.decrypt(en)
    print type(de), de

    data = """{"a": "123中文", 's': 'ss'}"""
    print  type(data)
