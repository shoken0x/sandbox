#input
$V = [1, 5, 10, 50, 100, 500]

# 1円玉3枚, 10円玉2枚... 500円玉2枚
$C = [3, 2, 1, 3, 0, 2]
$A = 620 #620円支払う

def slove
  ans = 0
  5.downto(0) do |i|
    t = [$A / $V[i], $C[i]].min
    $A -= t * $V[i]
    ans += t
  end
  puts ans
end

slove
