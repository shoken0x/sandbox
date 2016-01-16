# input
$n = 4
$w = [2, 1, 3, 2]
$v = [3, 2, 4, 2]
$W = 5

# 重さ$wと価値$vの組み合わせの品物が$n個ある
# 重さの総和が$Wを超えないように選んだときの価値の総和の最大値を求める

def rec(i, j)
  if i == $n
    res = 0
  elsif j < $w[i]
    res = rec(i + 1, j)
  else
    res = [rec(i + 1, j), rec(i + 1, j - $w[i]) + $v[i]].max
  end
  res
end

def slove
  puts rec(0, $W)
end

slove
