# input
$n = 4
$a = [1, 2, 4, 7]
$k = 13

# 配列aからいくつか選び、その和をちょうどkにすることが
# できるかを求める

def dfs(i, sum)
  return sum == $k if i == $n
  return true if dfs(i + 1, sum)
  return true if dfs(i + 1, sum + $a[i])

  return false
end

def slove
  puts result = dfs(0, 0) ? 'Yes' : 'No'
end

slove
