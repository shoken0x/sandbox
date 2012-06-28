#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'crack'
require 'json'
require 'xmlsimple'
require "kconv"
require "mongo"

#xml_original = '
#<?xml version="1.0" encoding="UTF-8" ?>
#<venture>
#  <company>
#    <name>なんとか株式会社</name>
#    <url>http://www.softbank.co.jp/</url>
#  </company>
#
#  <company>
#    <name>楽天株式会社</name>
#    <url>http://www.rakuten.co.jp/info/</url>
#  </company>
#</venture>
#'

xml_original = '
<?xml version="1.0" encoding="UTF-8" ?>
<PAGE>
  <EMPLOYEES>
    <EMPLOYEE>
      <EMPNO>1</EMPNO>
      <ENAME>佐野力</ENAME>
      <JOB>President</JOB>
      <HIREDATE>1990-04-01</HIREDATE>
      <SAL>10000</SAL>
      <DEPTNO>10</DEPTNO>
    </EMPLOYEE>
    <EMPLOYEE>
      <EMPNO>50</EMPNO>
      <ENAME>高橋敦子</ENAME>
      <JOB>Director</JOB>
      <MGR>1</MGR>
      <HIREDATE>1991-04-01</HIREDATE>
      <SAL>6000</SAL>
      <DEPTNO>30</DEPTNO>
    </EMPLOYEE>
    <EMPLOYEE>
      <EMPNO>1401</EMPNO>
      <ENAME>小山尚彦</ENAME>
      <JOB>Analyst</JOB>
      <MGR>50</MGR>
      <HIREDATE>1999-09-01</HIREDATE>
      <SAL>3000</SAL>
      <DEPTNO>30</DEPTNO>
    </EMPLOYEE>
  </EMPLOYEES>
</PAGE>
'

puts ""
puts "original xml "
puts xml_original

xml_ = Crack::XML.parse(xml_original)

puts ""
puts "xml to hash = "
p xml_

puts "insert hash into mongodb "
db = Mongo::Connection.new.db('test')
db['json'].insert(xml_)

#puts ""
#puts "print name = "
#p xml_['venture']['company'][0]['name']

puts ""
puts "hash to json = "
p json_ = xml_.to_json


puts ""
puts "json back to hash = "
p xml2_ = Crack::JSON.parse(json_)

puts "XmlSimple.xml_out"
puts XmlSimple.xml_out(xml_, {'KeepRoot' => true,'NoAttr' => true})
