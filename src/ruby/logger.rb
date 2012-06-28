#!/usr/bin/ruby -w0
# -*- coding: utf-8 -*-
require 'logger'

STDERR.puts 'fujisaki'

log = Logger.new('foo.log')
log.level = Logger::WARN

log.warn("Nothing to do!")
p 'ruby test'
