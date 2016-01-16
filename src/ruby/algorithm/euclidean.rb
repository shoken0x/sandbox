def gcd(a, b)
  return a if b == 0
  gcd(b, a % b)
end

if ARGV[0].nil? || ARGV[1].nil?
  a, b = 1071, 1029 # gcd(a, b) => 21
else
  a, b = ARGV[0].to_i, ARGV[1].to_i
end
puts gcd(a, b)
