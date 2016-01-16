def extgcd(a, b)
  if b.zero?
    {x: 1, y: 0, gcd: a}
  else
    prev = extgcd(b, a % b)
    { x: prev[:y],
      y: prev[:x] - (a / b) * prev[:y],
      gcd: prev[:gcd] }
  end
end

p extgcd(6728, 4263) # => {:x=>64, :y=>-101, :gcd=>29}
