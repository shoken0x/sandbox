# Union-Find木
MAX_N = 100
$parent = Array.new(MAX_N)
$rank = Array.new(MAX_N, 0)

def init(n)
  n.times do |i|
    $parent[i] = i
  end
end

def find(x)
  if $parent[x] == x
    x
  else
    $parent[x] = find($parent[x])
  end
end

def unite(x, y)
  x = find(x)
  y = find(y)
  return true if x == y

  if $rank[x] < $rank[y]
    $parent[x] = y
  else
    $parent[y] = x
    $rank[x] += 1 if $rank[x] == $rank[y]
  end
end

def same?(x, y)
  find(x) == find(y)
end

init(MAX_N * 3)
unite(1, 2)
unite(3, 4)
p same?(1, 2) # => true
p same?(1, 3) # => false

unite(1, 3)
p same?(1, 3) # => true
p same?(2, 4) # => true
