#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'cgi'
require "rexml/document"
require 'net/http'
require 'uri'

# IDを格納する配列オブジェクトの用意（生成）
follower_ids=Array.new

# フォロワー一覧を取得（Twitter API呼び出し）
temp_xml=Net::HTTP.start('twitter.com', 80) {|http|
  response = http.get('/friends/ids/jazzken_tsukuba.xml')
}

# XMLデータのオブジェクトを生成？（うまく説明できない）
doc = REXML::Document.new temp_xml.body

p doc.elements

doc.elements.each('/ids/id') do |userid|
  temp_xml=Net::HTTP.start('twitter.com', 80) {|http|
    response = http.get("/users/show/#{userid.text}.xml")
  }
  doc2 = REXML::Document.new temp_xml.body
  p doc2.elements['/user/screen_name'].text
end
