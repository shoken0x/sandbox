def fizzbuzz(now,max,str)
  if(now%3 == 0 && now%5 == 0)
    str << 'FizzBuzz'
  elsif(now%5 == 0)
    str << 'Buzz'
  elsif(now%3 == 0)
    str << 'Fizz'
  else
    str << now.to_s
  end
  
  if(now >= max)
    puts str
    return
  end
  str << ','
  now += 1

  fizzbuzz(now,max,str)
end

fizzbuzz(1,100,'')
