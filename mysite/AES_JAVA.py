# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-08-12, by zhongjie.jia
#
#
from Crypto.Cipher import AES
import base64


class AESCipher:
    def __init__(self, key, block_size=0):
        self.key = key
        self.block_size = block_size or AES.block_size
        self.cipher = AES.new(self.key)

    def _pad(self, s):
        # print 'length s : ', len(s)
        # print 'need padding: ', self.block_size - len(s) % self.block_size
        # print 'padding char: ', chr(self.block_size - len(s) % self.block_size), 'length:', len(chr(self.block_size - len(s) % self.block_size))
        return s + (self.block_size - len(s) % self.block_size) * chr(self.block_size - len(s) % self.block_size)

    def _unpad(self, s):
        return s[:-ord(s[len(s) - 1:])]
        # return s[0:-ord(s[-1])]

    def encrypt(self, raw):
        return base64.b64encode(self.cipher.encrypt(self._pad(raw)))

    def decrypt(self, enc):
        return self._unpad(self.cipher.decrypt(base64.b64decode(enc)))

# block_size = AES.block_size
# pad = lambda s: s + (block_size - len(s) % block_size) * chr(block_size - len(s) % block_size)
# unpad = lambda s: s[0:-ord(s[-1])]

SECRET_KEY = "MeZoneB_V3.0.0LB"
text = 'to be encrypted'
test_json = {
    'a': u'hello 老杜',
    'b': [1, 3, u'小家']
}

if __name__ == '__main__':
    import json
    cipher = AESCipher(SECRET_KEY)
    encode_string = cipher.encrypt(json.dumps(test_json))
    print 'encode_string:', encode_string

    decode_string = cipher.decrypt(encode_string)
    print 'decode string:', decode_string