puts (1..100).to_a.map {|x|
  case
  when x % 15 == 0 then 'FizzBuzz'
  when x % 5 == 0 then 'Buzz'
  when x % 3 == 0 then 'Fizz'
  else x
 end
}
