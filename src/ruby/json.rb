#!/usr/bin/ruby -w0
# -*- coding: utf-8 -*-
require 'json'

env = JSON.parse(File.read('/Users/fujisaki/dotcloud/environment.json')) 

pw = env['DOTCLOUD_DATA_MYSQL_PASSWORD']
puts pw

