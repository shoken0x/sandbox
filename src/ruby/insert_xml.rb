#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'crack'
require 'json'
require 'xmlsimple'
require "mongo"

puts Time.now
Dir::glob("/root/src/xml_/*.xml").each {|f|
  file = open(f)
  json = Crack::XML.parse(file.read)
  #puts "insert hash into mongodb "
  db = Mongo::Connection.new.db('test',:pool_size => 1000)
  db['batch_ruby'].insert(json)
  #f.each {|line| print line}
  file.close
}
puts Time.now
