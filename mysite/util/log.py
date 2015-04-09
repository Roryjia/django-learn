#coding=utf-8
#/usr/bin/python
__author__ = 'zhongjie.jia'

import logging


def error_log(msg=''):
    logger = logging.getLogger('error')
    logger.error(msg)


def info_log(msg=''):
    logger = logging.getLogger('info')
    logger.info(msg)


def debug_log(msg=''):
    logger = logging.getLogger('debug')
    logger.debug(msg)