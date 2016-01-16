# input
$n = 4
$m = 4
$s = "abcd"
$t = "becd"

# 2つの文字列の、共通部分列の長さの最大値を求める
# 解 3 "bcd"

$dp = Array.new($n + 1, 0){ Array.new($m + 1, 0)}

def slove
  $n.times.each do |i|
    $m.times.each do |j|
      if $s[i] == $t[j]
        $dp[i + 1][j + 1] = $dp[i][j] + 1
      else
        $dp[i + 1][j + 1] = [$dp[i][j + 1], $dp[i + 1][j]].max
      end
    end
  end
  puts $dp[$n][$m]
end

slove
