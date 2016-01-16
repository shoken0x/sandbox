# input
$n = 4
$w = [2, 1, 3, 2]
$v = [3, 2, 4, 2]
$W = 5
$dp = Array.new($n + 1, 0){ Array.new($W + 1, 0)}

# 重さ$wと価値$vの組み合わせの品物が$n個ある
# 重さの総和が$Wを超えないように選んだときの価値の総和の最大値を求める
# 動的計画法 Dynamic Programming

def slove
  ($n - 1).downto(0) do |i|
    ($W + 1).times do |j|
      if j < $w[i]
        $dp[i][j] = $dp[i + 1][j]
      else
        $dp[i][j] = [$dp[i + 1][j], $dp[i + 1][j - $w[i]] + $v[i]].max
      end
    end
  end
  p $dp
  puts $dp[0][$W]
end

slove
