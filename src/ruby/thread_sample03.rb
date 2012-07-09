require 'parallel'

def rand_str(digits)
  charset = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  Array.new(digits){charset[rand(charset.size)]}.join
end

puts "#{Parallel.processor_count} procesor(s)"

#Parallel.each(
#  (0..10000).each { |i|
#    str_a[i] = rand_str(1024)
#    puts i
#  }
#)

set_rand = lambda {|str|
  str = rand_str(1024)
}

str_a = Array.new(100000)
Parallel.each(str_a, &set_rand)

