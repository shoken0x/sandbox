#!/usr/local/bin/jruby
require 'rubygems'
gem PLATFORM == 'java' ? 'rmagick4j' : 'rmagick'
require 'RMagick'
include Magick

images = ImageList.new("sf.jpg")

dr = Draw.new()
dr.fill = "#00000050"
dr.roundrectangle(40,50, 160,80, 10,10)
dr.polygon(*[100,81, 100,91, 110,81])
dr.draw(images)

puts "OK"
