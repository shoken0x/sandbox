#!/usr/bin/ruby -w0
# -*- coding: utf-8 -*-
require 'open-uri'

url = 'http://it-ebooks.info/'
book = 'book/'
#n = '335'

for i in 1..100
  html = '' 
  open(url + book + i.to_s + '/'){|f| html << f.read }

  puts url + book + i.to_s + '/'

  reg_url = /href="\/go\/(.*?)['"]/
  str = html.scan(reg_url)[0].join
  dl_url = url + 'go/' + str
  puts dl_url 

  reg_title = /rel="nofollow">(.*?)<\/a>/
  puts title = html.scan(reg_title)[0].join

  system("wget -O '#{title}.pdf' #{dl_url}")
end
