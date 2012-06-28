require 'fileutils'
src = ARGV[0]

(1..5000).each {|i|
  FileUtils.cp( src, "#{i}.xml" )
}
