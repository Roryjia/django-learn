# -*-coding:utf-8 -*-
#
# Copyright (C) 2012-2014 Lianbi TECH Co., Ltd. All rights reserved.
# Created on 2014-08-08, by zhongjie.jia
#
#

from Crypto.Cipher import AES
import base64
import os


"""
32 bytes = 256 bits
16 = 128 bits
the block size for cipher obj, can be 16 24 or 32. 16 matches 128 bit.
"""
BLOCK_SIZE = 16

"""
the character used for padding--with a block cipher such as AES, the value
you encrypt must be a multiple of BLOCK_SIZE in length. This character is
used to ensure that you value is always a multiple of BLOCK_SIZE
"""
PADDING = '{'

"""
one-liner to sufficiently pad the text to be encrypted
"""
pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * PADDING

"""
one-liners to encrypt/encode adn decrypt/decode a string
encrypt with AES, encode with base64
"""
EncodeAES = lambda c, s: base64.b64encode(c.encrypt(pad(s)))
# EncodeAES = lambda c, s: c.encrypt(pad(s))

DecodeAES = lambda c, e: c.decrypt(base64.b64decode(e)).rstrip(PADDING)
# DecodeAES = lambda c, e: c.decrypt(e).rstrip(PADDING)

# generate a random secret key
# secret = os.urandom(BLOCK_SIZE)
secret = "MeZoneB_V3.0.0LB"

# create a cipher(密码) object using the random secret
cipher = AES.new(secret)

# encode a string
encoded_string = EncodeAES(cipher, 'hello')
print 'Encrypted string:', encoded_string

print 'Decoded string:', DecodeAES(cipher, encoded_string)

