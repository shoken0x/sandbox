#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os.path
import tornado.web
import tornado.auth
import tornado.httpserver
import tornado.ioloop
import tornado.escape
from tornado.process import fork_processes, task_id
import pymongo
from bson.objectid import ObjectId
from pymongo import Connection
import datetime
import string, random
import pytz
import boto.ec2
import logging


def ec2():
    aws_access_key_id = ''
    aws_secret_access_key = ''
    kw_params = {}
    kw_params.update({'aws_access_key_id':aws_access_key_id})
    kw_params.update({'aws_secret_access_key':aws_secret_access_key})
    conn = boto.ec2.connect_to_region('ap-northeast-1', **kw_params)
    #res = conn.get_all_instances(filters={'tag-value': 'mongodb-query-test'})
    res = conn.get_all_instances()
    con = Connection(host='localhost')
    db = con['mongodb-test']

    a = ['ec2-xxxxxx.ap-northeast-1.compute.amazonaws.com']

    for x in a:
        print x
        db.public_dns_name.insert({
            'public_dns_name': x
            })
#if res:
#    for inst in res:
#        name = inst.instances[0].tags['Name']
#        logging.warning(name)
#        if name == 'ClientMaster2':
#            if inst.instances[0].public_dns_name != None:
#                logging.warning(name)
#                print inst.instances[0].public_dns_name
#                db.public_dns_name.insert({
#                       'public_dns_name': inst.instances[0].public_dns_name
#                       })
    con.close()

def run():
    aws_access_key_id = ''
    aws_secret_access_key = ''
    kw_params = {}
    kw_params.update({'aws_access_key_id':aws_access_key_id})
    kw_params.update({'aws_secret_access_key':aws_secret_access_key})
    conn = boto.ec2.connect_to_region('ap-northeast-1', **kw_params)
    conn.run_instances('ami-xxxxxxxx', key_name='', instance_type='m1.medium', security_groups=['default', 'quick-start-1'], max_count='20')

ec2()
